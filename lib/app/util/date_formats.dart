// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum DateFormatEnum {
  dayMonthYear,
  weekdayDayMonthYear,
  weekdayShort,
  hourMinute12h,
  hourMinute24h,
  monthYear,
  monthDay,
  yearMonthDay,
  dayMonth,
  dayMonthYearShort,
  monthYearShort,
  onlyMonth,
}

extension DateFormatEnumExt on DateFormatEnum {
  String get string {
    switch (this) {
      case DateFormatEnum.dayMonthYear:
        return 'dd/MM/yyyy';
      case DateFormatEnum.weekdayDayMonthYear:
        return 'EEE dd/MM/yyyy';
      case DateFormatEnum.weekdayShort:
        return 'E';
      case DateFormatEnum.hourMinute12h:
        return 'h:mm a';
      case DateFormatEnum.hourMinute24h:
        return 'HH:mm';
      case DateFormatEnum.monthYear:
        return 'MMMM yyyy';
      case DateFormatEnum.monthDay:
        return 'MMMMd';
      case DateFormatEnum.yearMonthDay:
        return 'yMMMMd';
      case DateFormatEnum.dayMonth:
        return 'dd MMMM';
      case DateFormatEnum.dayMonthYearShort:
        return 'dd/MM/yy';
      case DateFormatEnum.monthYearShort:
        return 'MMMyy';
      case DateFormatEnum.onlyMonth:
        return 'MMM';
    }
  }
}

extension DateTimeConvert on String {
  DateTime toDateTime(DateFormatEnum format) {
    final dateFormat = DateFormat(format.string, Get.locale?.languageCode);
    return dateFormat.parse(this);
  }
}

extension TimeStamp on DateTime {
  int toTimeStamp() => millisecondsSinceEpoch;
}

extension DateTimeToStringExt on DateTime {
  String localTimeZoneString(DateFormatEnum format) {
    final dateFormat = DateFormat(format.string, Get.locale?.languageCode);
    return dateFormat.format(toLocal());
  }

  String localTimeZoneTimeOnly() {
    final context = Get.context;
    bool is24HoursFormat = false;
    if (context != null) {
      is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    }
    final time = localTimeZoneString(is24HoursFormat
        ? DateFormatEnum.hourMinute24h
        : DateFormatEnum.hourMinute12h);
    return time;
  }
}

abstract class ServerDateFormats {
  static const String yearMonthDay = 'yyyy-MM-dd';
}
