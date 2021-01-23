import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    @required this.height,
    @required this.width,
    @required this.buttonColor,
    @required this.shadowColor,
    @required this.iconColor,
    @required this.icon,
    @required this.text,
    @required this.myHeight,
    @required this.myWidth,
  });

  final double height;
  final double width;
  final double myHeight;
  final double myWidth;
  final Color buttonColor;
  final Color shadowColor;
  final Color iconColor;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: myHeight,
            padding: EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.01),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(height),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon,color: iconColor,size: height*.05,),
                SizedBox(width: width*.03,),
                Text(
                  '$text  ',
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.w500,
                    fontSize: height*.03
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
