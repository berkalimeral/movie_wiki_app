import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension StringExtension on String {
  String? toHour(int? value) {
    if (value != null) {
      final int hour = value ~/ 60;
      final int minutes = value % 60;
      return '${hour.toString().padLeft(2, "0")}h ${minutes.toString().padLeft(2, "0")}min';
    } else {
      return null;
    }
  }

  String calcAge() {
    String year = split('-').first;
    String thisYear = DateTime.now().year.toString();
    String age = (int.tryParse(thisYear)! - int.tryParse(year)!).toString();
    return age;
  }
}
