extension DateTimeConvert on DateTime {
  String toDateTimeString() {
    return "$day.$month.$year ${_getDateTimeComponentPaddedLeft(hour)}:${_getDateTimeComponentPaddedLeft(minute)}";
  }

  String toApiCompatibleString() {
    final monthString = _getDateTimeComponentPaddedLeft(month);
    final dayString = _getDateTimeComponentPaddedLeft(day);
    final hourString = _getDateTimeComponentPaddedLeft(hour);
    final minuteString = _getDateTimeComponentPaddedLeft(minute);
    final secondString = _getDateTimeComponentPaddedLeft(second);
    return "$year-$monthString-${dayString}T$hourString:$minuteString:$secondString";
  }

  String _getDateTimeComponentPaddedLeft(int component) {
    final stringValue = component.toString();
    return stringValue.padLeft(2, "0");
  }
}
