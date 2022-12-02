import 'dart:math';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  DateTime get firstDateInYear => DateTime(year, 1, 1, 0, 0);

  // Monday as the start
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDateInYear => DateTime(year + 1, 1, 0, 0, 0);

  DateTime addYears({int? years}) {
    return DateTime(year + (years ?? 0), month, day);
  }

  bool isSameDate(DateTime dateTime) {
    return year == dateTime.year &&
        month == dateTime.month &&
        day == dateTime.day;
  }

  bool isSameMonth(DateTime dateTime) {
    return year == dateTime.year && month == dateTime.month;
  }

  int differentInMonth(DateTime startDate) {
    assert(startDate.isBefore(this));
    return month - startDate.month + (12 * (year - startDate.year));
  }

  DateTimeRange get monthRange {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 1).subtract(
      const Duration(days: 1),
    );

    return DateTimeRange(start: start, end: end);
  }

  DateTime get localDate {
    return DateTime(year, month, day);
  }

  String get timeAgo {
    final minutes = max(DateTime.now().difference(this).inMinutes, 1);
    if (minutes == 1) {
      // Request sent one minute --> display Il y a %{count} minute.
      return '$minutes ${AppStrings.seconds_ago_text}';
    } else if (minutes < 61) {
      // Request sent less than 61 minutes --> display Il y a %{count} minutes.
      return '$minutes ${AppStrings.minutes_ago_text}';
    } else if (minutes >= 61 && minutes < 1500) {
      // Request sent between 61 minutes and 1500 minutes  ago --> display Il y a %{count} heures (=total minutes /60)
      return '${(minutes / 60).round()} ${AppStrings.hours_ago_text}';
    } else if (minutes >= 1500 && minutes < 10080) {
      // Request sent between 1500 minutes and 10080 minutes days ago  --> display Il y a %{count} jours =total minutes / (60*24)
      return '${(minutes / 60 / 24).round()} ${AppStrings.days_ago_text}';
    } else if (minutes >= 10080 && minutes < 50400) {
      // Request sent between 10080 minutes and 302400 minutes --> display Il y a %{count} semaines =total minutes / (60*24*7)
      return '${(minutes / 60 / 24 / 7).round()} ${AppStrings.weeks_ago_text}';
    } else {
      // Request sent more than 302400 minutes  --> display Il y a %{count} mois = total minutes / (60*24*30)
      return '${(minutes / 60 / 24 / 30).round()} ${AppStrings.months_ago_text}';

    }
  }

  int get weekOfYear {
    // Add 3 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = (ordinalDate - weekday + 10) ~/ 7;

    // If the week number equals zero, it means that the given date belongs to the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, one must check that the date is not actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year, 1, 1).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }

  /// The ordinal date, the number of days since December 31st the previous year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  /// True if this date is on a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
}
