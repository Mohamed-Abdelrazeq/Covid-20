import 'package:flutter/material.dart';

class SyndromeScreen extends StatelessWidget {

  SyndromeScreen({
    @required this.syndromeName,
    @required this.imagePath,
    @required this.mySyndromeData,
  });

  final String syndromeName;
  final String mySyndromeData;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),),
      child:Scaffold(
        backgroundColor: Color(0xff8cd0d7).withOpacity(0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*.08),
          child: ListView(
            children: [
              SizedBox(height: height*.05,),
              Container(
                height: height*.3,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    )
                ),
              ),
              SizedBox(height: height*.02,),
              Center(
                child: Text(
                  'Cough',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.95),
                      fontWeight: FontWeight.w500,
                      fontSize: height*.05
                  ),
                ),
              ),
              SizedBox(height: height*.02,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width*.08,vertical: height*.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Text(
                  mySyndromeData,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              SizedBox(height: height*.05,),
            ],
          ),
        ),
      ),
    );
  }
}
