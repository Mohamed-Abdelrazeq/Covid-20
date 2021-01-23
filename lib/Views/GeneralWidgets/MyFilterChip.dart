import 'package:flutter/material.dart';
import 'Constants.dart';


// ignore: must_be_immutable
class MyFilterChip extends StatefulWidget {
  MyFilterChip({this.genre});

  bool isSelected = true;
  String genre;

  @override
  _MyFilterChipState createState() => _MyFilterChipState();
}

class _MyFilterChipState extends State<MyFilterChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: FilterChip(
        label: Text(widget.genre),
        labelStyle:
        TextStyle(color: widget.isSelected ? Colors.black : Colors.white),
        selected: widget.isSelected,
        onSelected: (bool selected) {
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        selectedColor: cSmithApple,
        checkmarkColor: Colors.black,
      ),
    );
  }
}