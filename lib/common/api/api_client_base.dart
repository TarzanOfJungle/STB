import 'package:split_the_bill/common/api/api_exception.dart';

import 'http_method.dart';

typedef ResponseErrorListener = void Function(ApiException exception);

abstract class ApiClientBase {
  /// Sets the token for authorization of user
  void setToken(String? token);

  /// Adds a listener, which will get called
  /// when any of the requests ends up with error
  void addErrorListener(ResponseErrorListener listener);

  /// Removes a previously added listener for
  /// request errors.
  void removeErrorListener(ResponseErrorListener listener);

  /// Sends an HTTP request with optional body. Is expedted to return data,
  /// which are to be parsed from JSON using the processBody function.
  Future<T> sendDataRequest<T>({
    required String path,
    required HttpMethod method,
    bool useAuthentication = true,
    bool notifyErrorListeners = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
    required T Function(String rawBody) processBody,
  });

  /// Sends an HTTP request with optional body. Is expedted not expected to return data,
  /// instead returns the response status code.
  Future<int> sendRequest({
    required String path,
    required HttpMethod method,
    bool useAuthentication = true,
    bool notifyErrorListeners = true,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? queryParams,
    Map<String, String> additionalHeaders = const {},
  });
}
