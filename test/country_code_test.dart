import 'package:medcollapp_assignment/utils/api_fetcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medcollapp_assignment/utils/country_data.dart';

void main() {
  test('Country Code Fetching', () async {
    final String code = "US";

    CountryData data = await getCountryData(code);

    expect(data.capital, 'Washington');
  });
}
