import 'package:appli_voyage/views/home/city/widgets/trip_activity_list.dart';

import '../../../../models/trip_model.dart';
import '../widgets/activity_list.dart';
import '../widgets/trip_overview.dart';

import '../../../../models/activity_model.dart';
import 'package:flutter/material.dart';

import '../../../../data/data.dart' as data;

class Citys extends StatefulWidget {
  final List<Activity> activities = data.activities;

  showContext({BuildContext context, List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  _CitysState createState() => _CitysState();
}

class _CitysState extends State<Citys> with WidgetsBindingObserver {
  Trip myTrip;
  int index;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    index = 0;
    myTrip = Trip(activities: [], date: null, city: 'Paris');
  }

  List<Activity> get tripActivities {
    return widget.activities.where((activity) {
      return myTrip.activities.contains(activity.id);
    }).toList();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
              myTrip: myTrip,
              setDate: setDate,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
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
