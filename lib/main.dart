import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medcollapp_assignment/pages/home.dart';
import 'package:medcollapp_assignment/utils/state/data_provider.dart';
import 'package:provider/provider.dart';

main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CountryDataNotifier(),
        builder: (context, child) => HomePage(),
      ),
    );
  }
}
