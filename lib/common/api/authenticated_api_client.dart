import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:split_the_bill/common/api/base_api_client.dart';
import 'package:split_the_bill/common/api/http_method.dart';

const int _UNAUTHORIZED_STATUS_CODE = 401;

class AuthenticatedApiClient implements BaseApiClient {
  late final http.Client _httpClient = http.Client();
  String get _token =>
      "TODO: later get from the authentication controller, which will be passed as a parameter";

  /// Sends an HTTP request with optional body. Is expedted to return data,
  ///which are to be parsed from JSON using the processBody function.
  @override
  Future<T> sendDataRequest<T>({
    required String url,
    required HttpMethod method,
    bool useAuthentication = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
    required T Function(String body) processBody,
  }) async {
    final request = _createRequest(
      url: url,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    final streamed = await _httpClient.send(request);
    final res = await http.Response.fromStream(streamed);

    if (res.statusCode == _UNAUTHORIZED_STATUS_CODE) {
      // TODO: Handle 401 response and getting new token automatically
    }

    return processBody(res.body);
  }

  @override
  Future<int> sendRequest({
    required String url,
    required HttpMethod method,
    bool useAuthentication = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  }) async {
    final request = _createRequest(
      url: url,
      method: method,
      useAuthentication: useAuthentication,
      jsonBody: jsonBody,
      queryParams: queryParams,
      additionalHeaders: additionalHeaders,
    );

    final streamed = await _httpClient.send(request);
    final res = await http.Response.fromStream(streamed);

    if (res.statusCode == _UNAUTHORIZED_STATUS_CODE) {
      // TODO: Handle 401 response and getting new token automatically
    }

    return res.statusCode;
  }

  http.Request _createRequest({
    required String url,
    required HttpMethod method,
    required bool useAuthentication,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  }) {
    final uri = Uri.parse(url);
    uri.queryParameters.addAll(queryParams ?? {});

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
}
