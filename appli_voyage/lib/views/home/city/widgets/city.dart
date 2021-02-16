import 'dart:ui';

import '../../../../widgets/drawer.dart';

import '../../../../models/city_model.dart';
import 'package:appli_voyage/views/home/city/widgets/trip_activity_list.dart';

import '../../../../models/trip_model.dart';
import '../widgets/activity_list.dart';
import '../widgets/trip_overview.dart';

import '../../../../models/activity_model.dart';
import 'package:flutter/material.dart';

class Citys extends StatefulWidget {
  static const String routeName = '/city';
  final CityModel city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  Citys({this.city, this.addTrip});

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

  double get amount {
    return myTrip.activities.fold(0.0, (prev, element) {
      var activity =
          widget.activities.firstWhere((activity) => activity.id == element);
      return prev + activity.price;
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Voulez vous save ?',
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  child: const Text(
                    'sauvegarder',
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text('annuler'),
                )
              ],
            ),
          ],
        );
      },
    );
    if (result == 'save') {
      widget.addTrip(myTrip);
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation voyage'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
              cityName: widget.city.name,
              myTrip: myTrip,
              setDate: setDate,
              amount: amount,
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_alt),
        onPressed: saveTrip,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: ('Découvete'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.stars),
            label: ('Mes activites'),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
