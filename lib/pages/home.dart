import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medcollapp_assignment/pages/components/test_text.dart';
import 'package:medcollapp_assignment/utils/api/api_fetcher.dart';
import 'package:medcollapp_assignment/utils/models/country_data.dart';
import 'package:medcollapp_assignment/utils/location/locator.dart';
import 'package:medcollapp_assignment/utils/state/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryDataNotifier>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          body: value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  strokeWidth: 4,
                ))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnText(
                          text: "Country Name: ${value.data.countryName}"),
                      ColumnText(text: "Capital: ${value.data.capital}"),
                      ColumnText(
                        text:
                            "1 USD = ${value.data.rate} ${value.data.currencyCode}",
                      ),
                      ColumnText(text: 'Continent: ${value.data.continent}'),
                      ColumnText(
                          text: 'Area in Sq Km: ${value.data.areaInSqKm}'),
                      ColumnText(text: 'Population: ${value.data.population}'),
                      ElevatedButton(
                        onPressed: () async {
                          bool available =
                              await InternetConnectionChecker().hasConnection;
                          if (!available) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'Internet Connection Not Available'),
                              ),
                            );
                          } else {
                            value.refreshData();
                          }
                        },
                        child: Text('Refresh Data'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
