extension DateTimeConvert on DateTime {
  String toDateTimeString() {
    return "$day.$month.$year $hour:$minute";
  }
}
