import 'package:flutter/foundation.dart';

import 'activity_model.dart';

class CityModel {
  String image;
  String name;
  List<Activity> activities;

  CityModel({
    @required this.image,
    @required this.name,
    @required this.activities,
  });
}
