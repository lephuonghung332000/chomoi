
extension DoubleExt on double {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(toInt() * 1000);
}
