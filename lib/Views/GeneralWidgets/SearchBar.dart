import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.width,
    @required this.height,
    @required this.controller,
    @required this.myFunc,
  }) : super(key: key);

  final double width;
  final double height;
  final TextEditingController controller;
  final Function myFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: width * .08, right: width * .08),
      height: height * .1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            width: width * .63,
            height: .1 * height,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.9),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 15.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(height)),
            child: Center(
              child: TextField(
                  controller: controller,
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Search',
                  )),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: myFunc,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: width * .1),
              height: .1 * height,
              width: height*.1,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.9),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
