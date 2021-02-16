import '../../../../models/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final Function setDate;
  final Trip myTrip;
  final String cityName;
  final double amount;

  TripOverview({this.setDate, this.myTrip, this.cityName, this.amount});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  myTrip.date != null
                      ? DateFormat("d/M/y").format(myTrip.date)
                      : 'Choisissez une date ',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              RaisedButton(
                child: const Text(
                  'selectionner une date',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                onPressed: setDate,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: const Text(
                  'Montant / personne',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                '$amount \€',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
