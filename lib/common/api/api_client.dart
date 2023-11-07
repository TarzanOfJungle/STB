import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';

import 'api_exception.dart';

class ApiClient implements ApiClientBase {
  final http.Client _httpClient = http.Client();
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
    required T Function(Map<String, Object?>) processBody,
  }) async {
    final request = _createRequest(
      path: path,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    http.Response? res;
    try {
      final streamed = await _httpClient.send(request);
      res = await http.Response.fromStream(streamed);
    } catch (_) {
      throw const ApiNoConnectivityException();
    }

    if (_responseIsError(res)) {
      _handleError(res, notifyErrorListeners);
    }

    final Map<String, Object?> decoded = json.decode(res.body);

    return processBody(decoded);
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
    final request = _createRequest(
      path: path,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    http.Response? res;
    try {
      final streamed = await _httpClient.send(request);
      res = await http.Response.fromStream(streamed);
    } catch (_) {
      throw const ApiNoConnectivityException();
    }

    if (_responseIsError(res)) {
      _handleError(res, notifyErrorListeners);
    }

    return res.statusCode;
  }

  http.Request _createRequest({
    required String path,
    required HttpMethod method,
    required bool useAuthentication,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  }) {
    final uri = Uri(
      scheme: ApiConstants.protocol,
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
