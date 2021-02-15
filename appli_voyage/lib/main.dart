import 'package:appli_voyage/views/home/city/widgets/city.dart';
import 'package:appli_voyage/views/home/home.dart';
import 'package:appli_voyage/views/home/widgets/cityCard.dart';
import 'package:flutter/material.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.red,
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(fontSize: 30),
                ),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.blue,
                ),
              )),
      debugShowCheckedModeBanner: false,
      home: Home(),
      //home: Citys(),
    );
  }
}
