import 'package:amplify_core/amplify_core.dart';
import 'package:intl/intl.dart';

String formatDate({
  required DateTime? dateTime,
  String format = "dd",
}) {
  return dateTime != null ? DateFormat(format).format(dateTime) : "";
}

String formatMonth({
  required String? dateTime,
  String format = "MMM",
}) {
  return dateTime != null
      ? DateFormat(format).format(DateTime.parse(dateTime))
      : "";
}

String formatDay({
  required String? dateTime,
  String format = "YYYY",
}) {
  return dateTime != null ? DateTime.parse(dateTime).day.toString() : "";
}

String formatTime({
  required TemporalDateTime? dateTime,
}) {
  return dateTime != null
      ? DateFormat.jm().format(dateTime.getDateTimeInUtc())
      : "";
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";
  }

  String titleCase() {
    return split(" ").map((e) => e.capitalize()).toList().join(" ");
  }
}
