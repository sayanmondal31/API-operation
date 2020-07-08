import 'package:api_operation_2/services/countryService.dart';
import 'package:api_operation_2/views/country_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void serviceLocator(){
  GetIt.I.registerLazySingleton(() => CountryService());
  // GetIt.I.registerLazySingleton(() => CollegeService());
  GetIt.I.registerLazySingleton(() => TaxService());
}
void main() {
  serviceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
    
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Country()
    );
  }
}

