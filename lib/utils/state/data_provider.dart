import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medcollapp_assignment/utils/api/api_fetcher.dart';
import 'package:medcollapp_assignment/utils/database/database.dart';
import 'package:medcollapp_assignment/utils/location/locator.dart';
import 'package:medcollapp_assignment/utils/models/country_data.dart';

class CountryDataNotifier extends ChangeNotifier {
  late CountryData _data;
  Database db = Database();
  bool _isLoading = true;

  CountryDataNotifier() {
    _initializeData();
  }

  _initializeData() async {
    CountryData? d = await db.readData();
    if (d == null) {
      refreshData();
      _isLoading = false;
      return;
    }
    _data = d;
    _isLoading = false;
    notifyListeners();
  }

  CountryData get data => _data;
  bool get isLoading => _isLoading;

  set data(CountryData data) {
    _data = data;
    db.writeData(data);
    notifyListeners();
  }

  refreshData() async {
    _isLoading = true;
    notifyListeners();
    Position pos = await determinePosition();
    String countryCode = await getCountryCode(pos);
    CountryData da = await getCountryData("${countryCode[0]}${countryCode[1]}");
    _data = da;
    db.writeData(data);
    _isLoading = false;
    notifyListeners();
  }
}
