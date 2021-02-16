import './models/city_model.dart';
import './models/trip_model.dart';
import './views/home/city/widgets/city.dart';
import './views/home/home.dart';
import './views/home/trip/trips_view.dart';
import './data/data.dart' as data;
import 'package:flutter/material.dart';

main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  final List<CityModel> cities = data.cities;

  @override
  _DymaTripState createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  final List<Trip> trips = [
    Trip(
        activities: [],
        city: 'Paris',
        date: DateTime.now().add(Duration(days: 1))),
    Trip(
        activities: [],
        city: 'Lyon',
        date: DateTime.now().add(Duration(days: 2))),
    Trip(
        activities: [],
        city: 'Lille',
        date: DateTime.now().subtract(Duration(days: 1))),
  ];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.red,
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(fontSize: 30),
                  ),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    color: Colors.black,
                  ),
                )),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            return Home(cities: widget.cities);
          }
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Citys.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  final CityModel city = settings.arguments;
                  return Citys(
                    city: city,
                    addTrip: addTrip,
                  );
                });
              }
            case TripsView.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return TripsView(trips: trips);
                });
              }
          }
        } //home: Citys(),
        );
  }
}
