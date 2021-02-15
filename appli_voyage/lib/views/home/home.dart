import '../../models/city_model.dart';
import 'package:flutter/material.dart';

import 'widgets/cityCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    CityModel(name: 'Paris', image: 'assets/images/Paris.jpg'),
    CityModel(name: 'Lyon', image: 'assets/images/Lyon.jpg'),
    CityModel(name: 'Lille', image: 'assets/images/Lille.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('DymaTrip'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city) {
              return City(
                city: city,
              );
            })
          ],
        ),
      ),
    );
  }
}
