import 'dart:convert';

import 'package:hive/hive.dart';

class RateConversion {
  RateConversion({
    required this.success,
    required this.base,
    required this.date,
    required this.rates,
  });

  final bool success;
  final String base;
  final DateTime date;
  final String rates;

  String toRawJson() => json.encode(toJson());

  factory RateConversion.fromJson(Map<String, dynamic> json, String currency) {
    var r = json["rates"] as Map<String, dynamic>;
    return RateConversion(
      success: json["success"],
      base: json["base"],
      date: DateTime.parse(json["date"]),
      rates: r[currency]!.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": rates,
      };
}
