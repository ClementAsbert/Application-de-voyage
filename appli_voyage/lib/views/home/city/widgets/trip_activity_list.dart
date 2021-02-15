import 'package:appli_voyage/views/home/city/widgets/trip_activity_card.dart';
import 'package:flutter/material.dart';
import '../../../../models/activity_model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  TripActivityList({this.activities, this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: activities
            .map(
              (activity) => TripActivityCard(
                key: ValueKey(activity.id),
                activity: activity,
                deleteTripActivity: deleteTripActivity,
              ),
            )
            .toList(),
      ),
    );
  }
}
