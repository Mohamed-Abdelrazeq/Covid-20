import 'package:flutter/material.dart';

import 'Constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    @required this.width,
    @required this.height,
    @required this.myText,
    @required this.myFunc,
    @required this.horizontalPadding,
    @required this.verticalPadding,
    @required this.myTextColor,
  });

  final double width;
  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final String myText;
  final Function myFunc;
  final Color myTextColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: RaisedButton(
        onPressed: myFunc,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: cSmithApple,
        child: Text(
          myText,
          style: TextStyle(color: myTextColor, fontSize: height * .025),
        ),
      ),
    );
  }
}
