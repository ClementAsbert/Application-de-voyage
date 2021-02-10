import 'package:flutter/material.dart';

class City extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;
  final Function updateChecked;

  City({this.name, this.image, this.checked, this.updateChecked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150.00,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(image),
              child: InkWell(
                onTap: updateChecked,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          checked ? Icons.star : Icons.star_border,
                          color: Colors.white,
                          size: 40.00,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
