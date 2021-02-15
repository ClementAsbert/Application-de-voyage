import '../models/activity.model.dart';
import 'package:flutter/material.dart';
import '../data/data.dart' as data;

class Data extends InheritedWidget {
  final List<Activity> activities = data.activities;

  Data({Widget child}) : super(child: child);

  static Data of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  @override
  bool updateShouldNotify(Data old) => true;
}
