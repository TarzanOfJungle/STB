enum HttpMethod {
  get("GET"),
  post("POST"),
  put("PUT"),
  delete("DELETE"),
  head("HEAD");

  final String stringRepresentation;

  const HttpMethod(this.stringRepresentation);
}