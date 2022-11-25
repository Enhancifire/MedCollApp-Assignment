import 'package:hive/hive.dart';
import 'package:xml/xml.dart';

part 'country_data.g.dart';

@HiveType(typeId: 12)
class CountryData {
  CountryData({
    required this.countryCode,
    required this.countryName,
    required this.isoNumeric,
    required this.isoAlpha3,
    required this.fipsCode,
    required this.continent,
    required this.continentName,
    required this.capital,
    required this.areaInSqKm,
    required this.population,
    required this.currencyCode,
    required this.geonameId,
    required this.west,
    required this.north,
    required this.east,
    required this.south,
  });

  @HiveField(0)
  String countryCode;
  @HiveField(1)
  String countryName;
  @HiveField(2)
  String isoNumeric;
  @HiveField(3)
  String isoAlpha3;
  @HiveField(4)
  String fipsCode;
  @HiveField(5)
  String continent;
  @HiveField(6)
  String continentName;
  @HiveField(7)
  String capital;
  @HiveField(8)
  String areaInSqKm;
  @HiveField(9)
  String population;
  @HiveField(10)
  String currencyCode;
  @HiveField(11)
  String geonameId;
  @HiveField(12)
  String west;
  @HiveField(13)
  String north;
  @HiveField(14)
  String east;
  @HiveField(15)
  String south;

  @HiveField(16)
  late String rate;

  set currencyRate(String value) {
    rate = value;
  }

  factory CountryData.fromXML(XmlDocument doc) {
    XmlElement geo = doc.getElement('geonames')!;
    XmlElement country = geo.getElement('country')!;

    String countryCode = country.getElement('countryCode')!.text;
    String countryName = country.getElement('countryName')!.text;
    String isoNumeric = country.getElement('isoNumeric')!.text;
    String isoAlpha3 = country.getElement('isoAlpha3')!.text;
    String fipsCode = country.getElement('fipsCode')!.text;
    String continent = country.getElement('continent')!.text;
    String continentName = country.getElement('continentName')!.text;
    String capital = country.getElement('capital')!.text;
    String areaInSqKm = country.getElement('areaInSqKm')!.text;
    String population = country.getElement('population')!.text;
    String currencyCode = country.getElement('currencyCode')!.text;
    String geonameId = country.getElement('geonameId')!.text;
    String west = country.getElement('west')!.text;
    String north = country.getElement('north')!.text;
    String east = country.getElement('east')!.text;
    String south = country.getElement('south')!.text;

    return CountryData(
        countryCode: countryCode,
        countryName: countryName,
        isoNumeric: isoNumeric,
        isoAlpha3: isoAlpha3,
        fipsCode: fipsCode,
        continent: continent,
        continentName: continentName,
        capital: capital,
        areaInSqKm: areaInSqKm,
        population: population,
        currencyCode: currencyCode,
        geonameId: geonameId,
        west: west,
        north: north,
        east: east,
        south: south);
  }
}
