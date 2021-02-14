import 'package:appli_voyage/views/home/city/widgets/trip_activity_list.dart';

import '../../../../models/trip.model.dart';
import '../widgets/activity_list.dart';
import '../widgets/trip_overview.dart';

import '../../../../models/activity.model.dart';
import 'package:flutter/material.dart';

import '../../../../data/data.dart' as data;

class Citys extends StatefulWidget {
  final List<Activity> activities = data.activities;

  @override
  _CitysState createState() => _CitysState();
}

class _CitysState extends State<Citys> {
  Trip myTrip = Trip(activities: [], city: 'Paris', date: DateTime.now());
  int index = 0;

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((newDate) {
      if (newDate != null) {
        print(newDate);
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Organisation voyage'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(
              myTrip: myTrip,
              setDate: setDate,
            ),
            Expanded(
                child: index == 0
                    ? ActivityList(activities: widget.activities)
                    : TripActivityList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('Découvete'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: ('Mes activites'),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
