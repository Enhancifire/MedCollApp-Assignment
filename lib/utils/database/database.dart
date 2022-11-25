import 'package:hive/hive.dart';
import 'package:medcollapp_assignment/utils/models/rate_conversion.dart';
import 'package:medcollapp_assignment/utils/models/country_data.dart';

class Database {
  Database() {
    Hive.registerAdapter(CountryDataAdapter());
  }

  readData() async {
    var box = await Hive.openBox<CountryData>('dataBox');
    return box.get('countryData');
  }

  writeData(CountryData data) async {
    var box = await Hive.openBox<CountryData>('dataBox');
    box.put('countryData', data);
  }
}
