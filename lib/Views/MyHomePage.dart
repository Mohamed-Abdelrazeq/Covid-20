import 'package:covidnews_app/Data.dart';
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

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),),
        child: Scaffold(
          backgroundColor: Colors.redAccent.withOpacity(0),
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
                                      SyndromeCard(width: width, height: height,mySyndromeData:coughData ,mySyndromeName:'Breathing',imagePath: 'images/Breath.png',),
                                      SyndromeCard(width: width, height: height,mySyndromeData: breathData,mySyndromeName:'Cough'    ,imagePath: 'images/Cough.png',)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SyndromeCard(width: width, height: height,mySyndromeData: feverData,mySyndromeName:'Fever',imagePath: 'images/Fever.png',),
                                      SyndromeCard(width: width, height: height,mySyndromeData: headacheData,mySyndromeName:'Headache'    ,imagePath: 'images/Headache.png',)
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
                          FocusScope.of(context).requestFocus(FocusNode());
                          },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SyndromeCard extends StatelessWidget {
  const SyndromeCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.imagePath,
    @required this.mySyndromeName,
    @required this.mySyndromeData,
  }) : super(key: key);

  final double width;
  final double height;
  final String imagePath;
  final String mySyndromeName;
  final String mySyndromeData;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SyndromeScreen(syndromeName: mySyndromeName,imagePath: imagePath,mySyndromeData: mySyndromeData,),),
        );
      },
      child: Container(
        width: width*.4,
        height: height*.23,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height*.03),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage(imagePath),
                )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              mySyndromeName,
              style: TextStyle(
                fontSize:24,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

