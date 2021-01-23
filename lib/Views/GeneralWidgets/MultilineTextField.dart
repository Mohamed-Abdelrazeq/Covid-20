import 'package:flutter/material.dart';

class MultilineTextField extends StatelessWidget {
  const MultilineTextField({
    Key key,
    @required this.width,
    @required this.height,
    @required this.hint,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.myMaxLines,
    @required this.myController,
  }) : super(key: key);

  final double width;
  final double height;
  final String hint;
  final int myMaxLines;
  final Color textColor;
  final Color backgroundColor;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .92,
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height * .02),
      ),
      child: TextField(
        controller: myController,
        style: TextStyle(color: textColor, fontSize: 24),
        keyboardType: TextInputType.multiline,
        maxLength: (height * .5).toInt(),
        maxLines: myMaxLines,
        cursorColor: textColor,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: textColor, fontSize: 28),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
          contentPadding:
          EdgeInsets.only(left: 15, bottom: 30, top: 30, right: 15),
        ),
      ),
    );
  }
}
