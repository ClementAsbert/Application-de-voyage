import 'package:intl/intl.dart';

import '../../../../models/trip_model.dart';
import 'package:flutter/material.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  const TripList({this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, i) {
          var trip = trips[i];
          return ListTile(
            title: Text(trip.city),
            subtitle: trip.date != null
                ? Text(DateFormat('d/M/y').format(trip.date))
                : null,
            trailing: const Icon(Icons.info),
          );
        });
  }
}
