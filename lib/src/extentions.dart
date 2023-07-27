import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// [DateTimeRange] extensions.
extension DateTimeRangeExtensions on DateTimeRange {
  /// The difference of days between the [start] and [end] of the [DateTimeRange].
  int get dayDifference {
    DateTime end = this.end;
    if (end == end.startOfDay) {
      // Subtract 1 because the dateTimeRange does not span the last day.
      return start.startOfDay.difference(end.endOfDay).inDays.abs() - 1;
    } else {
      return start.startOfDay.difference(end.endOfDay).inDays.abs();
    }
  }

  /// The difference of months between the [start] and [end] of the [DateTimeRange].
  int get monthDifference {
    int months = ((start.year - end.year).abs() - 1) * 12;
    months += end.month + (12 - start.month);
    return months;
  }

  /// A list of [DateTime]s that the [DateTimeRange] spannes.
  List<DateTime> get datesSpanned {
    List<DateTime> dates = <DateTime>[];
    for (int i = 0; i < dayDifference; i++) {
      DateTime date = start.add(Duration(days: i));
      dates.add(DateTime(date.year, date.month, date.day));
    }
    return dates;
  }

  /// The number of years spanned by the [DateTimeRange].
  int get numberOfyears => end.year - start.year;

  /// Returns a new [DateTimeRange] with the start and end dates offset by the given [duration].
  DateTimeRange rescheduleDateTime(Duration duration) {
    return DateTimeRange(start: start.add(duration), end: end.add(duration));
  }

  /// The center [DateTime] of the [DateTimeRange].
  DateTime get centerDateTime => start.add(Duration(days: (dayDifference / 2).floor()));
}

/// [DateTime] extensions.
extension DateTimeExtentions on DateTime {
  /// Gets the start of the day.
  DateTime get startOfDay => DateTime(year, month, day);

  /// Gets the end of the day.
  /// [end] of day == [start] of next day.
  DateTime get endOfDay => DateTime(year, month, day + 1);

  /// Gets the start of the week with an offset.
  DateTime startOfWeekWithOffset(int firstDayOfWeek) {
    assert(firstDayOfWeek >= 1 && firstDayOfWeek <= 7, 'firstDayOfWeek must be between 1 and 7');
    return subtract(Duration(days: weekday - firstDayOfWeek)).startOfDay;
  }

  /// Gets the start of the week.
  DateTime get startOfWeek => startOfWeekWithOffset(1);

  /// Gets the end of the week with an offset.
  DateTime endOfWeekWithOffset(int firstDayOfWeek) => startOfWeekWithOffset(firstDayOfWeek).add(
        const Duration(days: 7),
      );

  /// Gets the end of the week.
  DateTime get endOfWeek => endOfWeekWithOffset(1);

  /// Gets the start of the month.
  DateTime get startOfMonth => DateTime(year, month);

  /// Gets the end of the month.
  DateTime get endOfMonth => DateTime(year, month + 1);

  /// Gets the start of the year.
  DateTime get startOfYear => DateTime(year);

  /// Gets the end of the year.
  DateTime get endOfYear => DateTime(year + 1);

  /// Gets the day range in which the [DateTime] is in.
  DateTimeRange get dayRange => DateTimeRange(start: startOfDay, end: endOfDay);

  /// Gets the four day range with the [DateTime] as the first day.
  DateTimeRange get threeDayRange =>
      DateTimeRange(start: startOfDay, end: endOfDay.add(const Duration(days: 2)));

  /// Gets the four day range with the [DateTime] as the first day.
  DateTimeRange get fourDayRange =>
      DateTimeRange(start: startOfDay, end: endOfDay.add(const Duration(days: 3)));

  /// Gets the week range in which the [DateTime] is in with an offset.
  DateTimeRange weekRangeWithOffset(int firstDayOfWeek) => DateTimeRange(
        start: startOfWeekWithOffset(firstDayOfWeek),
        end: endOfWeekWithOffset(firstDayOfWeek),
      );

  /// Gets the week range in which the [DateTime] is in.
  DateTimeRange get weekRange => weekRangeWithOffset(1);

  /// Gets the month range in which the [DateTime] is in.
  DateTimeRange get monthRange => DateTimeRange(start: startOfMonth, end: endOfMonth);

  /// Gets the year range in which the [DateTime] is in.
  DateTimeRange get yearRange =>
      DateTimeRange(start: DateTime(year, month), end: DateTime(year + 1, month));

  /// Checks if the [DateTime] is the same day as the calling object.
  bool isSameDay(DateTime date) => year == date.year && month == date.month && day == date.day;

  /// Checks if the [DateTime] is within the [DateTimeRange].
  bool isWithin(DateTimeRange range) => isAfter(range.start) && isBefore(range.end);

  /// Checks if the [DateTime] is today.
  bool get isToday => isSameDay(DateTime.now());

  /// Returns 'HH:mm' formatted [String] of the [DateTime].
  String get timeString => DateFormat('HH:mm').format(this);

  /// Gets the week number of date.
  int get weekNumber {
    int dayOfYear = int.parse(DateFormat('D').format(this));
    return ((dayOfYear - weekday + 10) / 7).floor();
  }
}