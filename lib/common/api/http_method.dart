enum HttpMethod {
  GET("GET"),
  POST("POST"),
  PUT("PUT"),
  DELETE("DELETE"),
  HEAD("HEAD");

  final String stringRepresentation;

  const HttpMethod(this.stringRepresentation);
}