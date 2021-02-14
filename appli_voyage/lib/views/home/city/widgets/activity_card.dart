import 'package:appli_voyage/models/activity.model.dart';
import 'package:flutter/material.dart';
import '../../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.all(1),
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
