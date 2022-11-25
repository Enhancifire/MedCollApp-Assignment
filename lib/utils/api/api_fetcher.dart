// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:medcollapp_assignment/utils/models/country_data.dart';
import 'package:medcollapp_assignment/utils/models/rate_conversion.dart';
import 'package:xml/xml.dart';

getConversionRate(String currency) async {
  String url =
      "https://api.exchangerate.host/latest?base=USD&symbols=${currency}&amount=1&places=2";
  var res = await http.get(Uri.parse(url));

  if (res.statusCode != 200) {
    return Future.error('Error while getting currency!');
  }

  var json = jsonDecode(res.body);
  return RateConversion.fromJson(json, currency);
}

Future<String> getCountryCode(Position pos) async {
  double lat = pos.latitude;
  double lng = pos.longitude;

  String url =
      "http://api.geonames.org/countryCode?lat=${lat}&lng=${lng}&username=medcollapp";

  var response = await http.get(Uri.parse(url));
  return response.body;
}

Future<CountryData> getCountryData(String code) async {
  String url =
      "http://api.geonames.org/countryInfo?country=${code}&username=medcollapp";
  var res = await http.get(Uri.parse(url));

  String body = res.body.toString();
  final doc = XmlDocument.parse(body);

  CountryData data = CountryData.fromXML(doc);

  RateConversion rate = await getConversionRate(data.currencyCode);
  data.currencyRate = rate.rates;

  return data;
}
