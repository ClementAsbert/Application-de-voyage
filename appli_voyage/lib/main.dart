import 'package:appli_voyage/views/home/city/widgets/city.dart';
import 'package:flutter/material.dart';

import 'views/home/home.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      home: Citys(),
    );
  }
}
