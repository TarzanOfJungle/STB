sealed class ApiException implements Exception {
  final int? code;
  final String? message;

  const ApiException([this.code, this.message]);
}

// For status codes == 401
class ApiClientUnauthorizedException extends ApiException {
  const ApiClientUnauthorizedException([super.code, super.message]);
}

// For status codes in the 400 - 499 range (except for 401)
class ApiClientException extends ApiException {
  const ApiClientException([super.code, super.message]);
}

// For status codes in the 500 - 599 range
class ApiServerException extends ApiException {
  const ApiServerException([super.code, super.message]);
}

// For encountering errors with internet connectivity
class ApiNoConnectivityException extends ApiException {
  const ApiNoConnectivityException([super.code, super.message]);
}

// Other errors
class ApiUnspecifiedException extends ApiException {
  const ApiUnspecifiedException([super.code, super.message]);
}
