import 'dart:convert';

extension JsonString on String {
  Map<String, Object?> asJsonObject() {
    return json.decode(this);
  }

  List<Map<String, Object?>> asJsonObjectArray() {
    final List jsonArray = json.decode(this);
    return jsonArray.map((item) => item as Map<String, dynamic>).toList();
  }
}
