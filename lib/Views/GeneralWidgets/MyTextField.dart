import 'package:flutter/material.dart';
import 'Constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    @required this.height,
    @required this.width,
    @required this.myWidth,
    @required this.myHeight,
    @required this.hint,
    @required this.myIcon,
  });

  final double height;
  final double width;
  final double myWidth;
  final double myHeight;
  final String hint;
  final IconData myIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      width: width * myWidth,
      height: myHeight * height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height * .02)),
      child: Center(
        child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: Colors.black87,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: 15),
              icon: Icon(
                myIcon,
                color: cSmithApple,
              ),
              hintText: hint,
            )),
      ),
    );
  }
}

