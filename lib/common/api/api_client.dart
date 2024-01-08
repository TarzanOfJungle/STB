import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'api_exception.dart';

class ApiClient implements ApiClientBase {
  final http.Client _httpRestClient = http.Client();
  final List<ResponseErrorListener> _errorListeners = [];

  String? _token;

  @override
  void setToken(String? token) {
    _token = token;
  }

  @override
  Future<T> sendDataRequest<T>({
    required String path,
    required HttpMethod method,
    bool useAuthentication = true,
    bool notifyErrorListeners = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
    required T Function(String rawBody) processBody,
  }) async {
    final request = _createRestRequest(
      path: path,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    http.Response? res;
    try {
      final streamed =
          await _httpRestClient.send(request).timeout(ApiConstants.timeout);
      res = await http.Response.fromStream(streamed);
    } catch (_) {
      throw const ApiNoConnectivityException();
    }

    if (_responseIsError(res)) {
      _handleError(res, notifyErrorListeners);
    }

    return processBody(res.body);
  }

  @override
  Future<int> sendRequest({
    required String path,
    required HttpMethod method,
    bool useAuthentication = true,
    bool notifyErrorListeners = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  }) async {
    final request = _createRestRequest(
      path: path,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    final http.Response res;
    try {
      final streamed =
          await _httpRestClient.send(request).timeout(ApiConstants.timeout);
      res = await http.Response.fromStream(streamed);
    } catch (_) {
      throw const ApiNoConnectivityException();
    }

    if (_responseIsError(res)) {
      _handleError(res, notifyErrorListeners);
    }

    return res.statusCode;
  }

  @override
  Stream<WebsocketEvent> listenForEvents({
    required String path,
    required List<WebsocketEvent> events,
    bool useAuthentication = true,
    Map<String, String>? queryParams,
  }) {
    final uri = _createWebsocketUri(
      path: path,
      useAuthentication: useAuthentication,
      queryParams: queryParams ?? {},
    );
    final channel = _connectWebsocketChannel(uri);
    return channel.stream.where((received) {
      try {
        return _getMatchingEvent(received, events) != null;
      } catch (_) {
        return false;
      }
    }).map((received) => _getMatchingEvent(received, events)!);
  }

  @override
  Stream<WebsocketEventWithData<T>> listenForDataEvents<T>({
    required String path,
    required List<WebsocketEvent> events,
    bool useAuthentication = true,
    Map<String, String>? queryParams,
    required T Function(String rawData) processEventData,
  }) {
    final uri = _createWebsocketUri(
      path: path,
      useAuthentication: useAuthentication,
      queryParams: queryParams ?? {},
    );
    final channel = _connectWebsocketChannel(uri);
    final dataStream = channel.stream.where((received) {
      try {
        return _getMatchingEvent(received, events) != null;
      } catch (_) {
        return false;
      }
    }).map((received) {
      final event = _getMatchingEvent(received, events)!;
      final string = received.toString().withoutLastChar();
      final arguments = string.asJsonObject()["arguments"] as List;
      final eventData = json.encode(arguments[0]);

      final result = WebsocketEventWithData(event, processEventData(eventData));

      return result;
    });

    return dataStream;
  }

  http.Request _createRestRequest({
    required String path,
    required HttpMethod method,
    required bool useAuthentication,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  }) {
    final uri = Uri(
      scheme: ApiConstants.httpProtocol,
      host: ApiConstants.host,
      path: path,
      queryParameters: queryParams,
    );

    final request = http.Request(method.stringRepresentation, uri);
    request.headers
        .addAll({"Content-Type": "application/json", ...additionalHeaders});
    if (useAuthentication) {
      request.headers.addAll({"Authorization": "Bearer $_token"});
    }
    if (jsonBody != null) {
      request.body = json.encode(jsonBody);
    }

    return request;
  }

  /// For unknown reasons, uri for websocket
  /// doesn't work, unless it is formed using
  /// Uri.parse() method.
  Uri _createWebsocketUri({
    required String path,
    required bool useAuthentication,
    Map<String, String> queryParams = const {},
  }) {
    var uriString =
        "${ApiConstants.webSocketProtocol}://${ApiConstants.host}/$path";
    if (useAuthentication || queryParams.isNotEmpty) {
      uriString = "$uriString?";
    }
    if (useAuthentication) {
      uriString =
          "$uriString${ApiConstants.websocketAuthenticationQueryKey}=$_token";
      if (queryParams.isNotEmpty) {
        uriString = "$uriString&";
      }
    }
    queryParams.forEach((key, value) {
      uriString = "$uriString$key=$value&";
    });
    return Uri.parse(uriString);
  }

  WebSocketChannel _connectWebsocketChannel(Uri uri) {
    final channel = WebSocketChannel.connect(uri);
    channel.sink.add(ApiConstants.websocketInitialHandshake);
    return channel;
  }

  WebsocketEvent? _getMatchingEvent(
    dynamic receivedMessage,
    List<WebsocketEvent> events,
  ) {
    final string = receivedMessage.toString().withoutLastChar();
    final eventName = string.asJsonObject()["target"];
    final matches = events.where((event) => event.messageName == eventName);
    return matches.firstOrNull;
  }

  @override
  void addErrorListener(ResponseErrorListener listener) {
    _errorListeners.add(listener);
  }

  @override
  void removeErrorListener(ResponseErrorListener listener) {
    _errorListeners.remove(listener);
  }

  void _handleError(
    http.Response response,
    bool notifyErrorListeners,
  ) {
    final code = response.statusCode;
    final message = response.body;
    ApiException exception = ApiUnspecifiedException(code, message);
    if (code == 401) {
      exception = ApiClientUnauthorizedException(code, message);
    } else if (code >= 400 && code < 500) {
      exception = ApiClientException(code, message);
    } else if (code >= 500 && code < 600) {
      exception = ApiServerException(code, message);
    }
    if (notifyErrorListeners) {
      _notifyErrorListeners(exception);
    }
    throw exception;
  }

  void _notifyErrorListeners(ApiException exception) {
    for (var listener in _errorListeners) {
      listener(exception);
    }
  }

  bool _responseIsError(http.Response res) {
    return res.statusCode >= 400;
  }
}
