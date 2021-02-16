import '../../widgets/drawer.dart';

import '../../models/city_model.dart';
import 'package:flutter/material.dart';

import 'widgets/cityCard.dart';

class Home extends StatefulWidget {
  final List<CityModel> cities;
  Home({this.cities});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DymaTrip'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...widget.cities.map((city) {
              return City(
                city: city,
              );
            }),
          ],
        ),
      ),
    );
  }
}
