import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/theme.dart';

String dateToDateStringUtils(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}

DateTime stringToDateUtils(String? value) {
  if (value == null || value.isEmpty) {
    return DateTime.now();
  }
  try {
    return DateTime.parse(value);
  } catch (e) {
    return DateFormat('MM/dd/yyyy').parse(value);
  }
}

Color getColorDateUtil(DateTime date) {
  DateTime currentDate = DateTime.now();

  if (date.isBefore(currentDate)) {
    return ApplicationTheme.primary;
  }
  if (currentDate.month == date.month && currentDate.year == date.year) {
    return ApplicationTheme.orange;
  }
  return ApplicationTheme.green;
}

String calculateDateUtils(DateTime date) {
  DateTime currentDate = DateTime.now();
  return date.isBefore(currentDate) ? 'VENCIDO' : 'VIGENTE';
}

String dateToTimeStringUtils(DateTime date) {
  final DateFormat formatter = DateFormat('HH:mm');
  return formatter.format(date);
}

String dateToDateTimeStringUtils(DateTime date) {
  return '${dateToDateStringUtils(date)} ${dateToTimeStringUtils(date)}';
}

bool isOlderThanSomeYearsUtils(DateTime selectedDate, int years) {
  DateTime currentDate = DateTime.now();
  DateTime minAllowedDate = DateTime(
    currentDate.year - years,
    currentDate.month,
    currentDate.day,
  );
  return selectedDate.isBefore(minAllowedDate);
}
