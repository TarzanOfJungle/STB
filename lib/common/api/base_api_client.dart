import 'http_method.dart';

abstract class BaseApiClient {
  /// Sends an HTTP request with optional body. Is expedted to return data,
  /// which are to be parsed from JSON using the processBody function.
  Future<T> sendDataRequest<T>({
    required String url,
    required HttpMethod method,
    bool useAuthentication = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
    required T Function(String body) processBody,
  });

  /// Sends an HTTP request with optional body. Is expedted not expected to return data,
  /// instead returns the response status code.
  Future<int> sendRequest({
    required String url,
    required HttpMethod method,
    bool useAuthentication = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  });
}
