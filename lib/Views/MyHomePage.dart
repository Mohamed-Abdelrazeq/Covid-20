import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CovidNewsPage.dart';
import 'file:///C:/Users/Abdel/Desktop/Flutter%20AYA%20Projects/CovidNews/covidnews_app/lib/Views/GeneralWidgets/SearchBar.dart';

TextEditingController countryNameController = TextEditingController();

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double top = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Color(0xff8cd0d7),
      body: Stack(
        children: [
          Positioned(
            top: -top,
            height: height + top,
            width: width,
            child: ListView(
              children: [
                Container(
                  height: height * .3,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/HeaderImage.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(height * .05),
                        bottomRight: Radius.circular(height * .05),
                      )),
                ),
                SizedBox(height: height*.07,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width*.06),
                  height: height * .62,
                  width: width,
                  child: Column(
                    children: [
                      Text(
                        'Syndromes',
                        style: TextStyle(
                            color: Colors.white.withOpacity(1),
                            fontSize: height*.05,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: height*.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*.2),
                        child: Divider(color: Colors.white,),
                      ),
                      SizedBox(height: height*.01,),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SyndromeCard(width: width, height: height),
                                  SyndromeCard(width: width, height: height)
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SyndromeCard(width: width, height: height),
                                  SyndromeCard(width: width, height: height)
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*.01,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * .25,
            child: Row(
              children: [
                SearchBar(
                  width: width,
                  height: height,
                  controller: countryNameController,
                  myFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CovidNewsPage(countryName: countryNameController.text ,)),
                    );
                    print('pressed');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SyndromeCard extends StatelessWidget {
  const SyndromeCard({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*.4,
      height: height*.23,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height*.03)
      ),
    );
  }
}
