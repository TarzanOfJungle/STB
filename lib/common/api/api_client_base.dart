import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';

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

  /// Subscribes to a websocket stream at the given [path].
  /// The returned stream only fires on events matching the [event.messageName],
  /// other values are ignored. The stream is not expected to yield any data (just
  /// fires when the given event occurs).
  /// 
  /// If [useAuthentication] is true, current
  /// logged in users's token is appended to the request. Other [queryParams]
  /// are optional. 
  Stream<void> listenForEvent({
    required String path,
    required WebsocketEvent event,
    bool useAuthentication = true,
    Map<String, String>? queryParams,
  });

  /// Subscribes to a websocket stream at the given [path].
  /// The returned stream only fires on events matching the [event.messageName],
  /// other values are ignored. The stream is expected to yield data in the occuring event,
  /// these data are to be parsed from the json format using the [processEventData] function.
  /// 
  /// If [useAuthentication] is true, current
  /// logged in users's token is appended to the request. Other [queryParams]
  /// are optional. 
  Stream<T> listenForDataEvent<T>({
    required String path,
    required WebsocketEvent event,
    bool useAuthentication = true,
    Map<String, String>? queryParams,
    required T Function(String rawData) processEventData
  });
}
