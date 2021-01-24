import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    @required this.height,
    @required this.width,
    @required this.theData,
    @required this.dataName,
  }) : super(key: key);

  final double height;
  final double width;
  final String theData;
  final String dataName;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        height: height*.3,
        width: width*.45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(height*.01)
        ),
        child: Center(
          child: Text(
            dataName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height*.03,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
          ),
        ),
      ),
      back: Container(
        height: height*.3,
        width: width*.45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(height*.01)
        ),
        child: Center(
          child: Text(
            theData,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height*.03,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
          ),
        ),
      ),
    );

  }
}
