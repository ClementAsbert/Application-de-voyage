import '../../../../models/activity.model.dart';
import 'package:flutter/material.dart';
import '../../../../data/data.dart' as data;

class Citys extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CitysState createState() => _CitysState();
}

class _CitysState extends State<Citys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
