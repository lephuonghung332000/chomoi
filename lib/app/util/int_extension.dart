import 'package:intl/intl.dart';

extension IntExt on int {
  String get currency {
    return NumberFormat.currency(locale: 'vi').format(this);
  }
}
