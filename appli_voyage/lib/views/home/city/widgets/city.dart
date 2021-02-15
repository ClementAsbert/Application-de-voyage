import 'package:appli_voyage/views/home/city/widgets/trip_activity_list.dart';
import '../../../../widgets/data.dart';

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
  Trip myTrip;
  int index;
  List<Activity> activities;

  @override
  void initState() {
    super.initState();
    index = 0;
    myTrip = Trip(activities: [], date: null, city: 'Paris');
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  List<Activity> get tripActivities {
    return activities.where((activity) {
      return myTrip.activities.contains(activity.id);
    }).toList();
  }

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

  void toggleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      myTrip.activities.remove(id);
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
                  ? ActivityList(
                      activities: activities,
                      selectedActivities: myTrip.activities,
                      toggleActivity: toggleActivity)
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
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
