import 'package:appli_voyage/views/home/trip/widgets/trip_list.dart';

import '../../../models/trip_model.dart';

import '../../../widgets/drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';
  final List<Trip> trips;

  TripsView({this.trips});

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mes voyages'),
          bottom: const TabBar(
            tabs: [
              const Tab(
                text: 'A venir',
              ),
              const Tab(
                text: 'Passés',
              )
            ],
          ),
        ),
        drawer: const DymaDrawer(),
        body: TabBarView(
          children: [
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isBefore(trip.date))
                  .toList(),
            ),
            TripList(
              trips: widget.trips
                  .where((trip) => DateTime.now().isAfter(trip.date))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
