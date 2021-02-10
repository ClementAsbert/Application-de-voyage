import 'package:flutter/material.dart';

import 'city.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Paris', 'image': 'assets/images/Paris.jpg', 'checked': false},
    {'name': 'Lyon', 'image': 'assets/images/Lyon.jpg', 'checked': false},
    {'name': 'Lille', 'image': 'assets/images/Lille.jpg', 'checked': false},
  ];

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

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
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () {
                  switchChecked(city);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
