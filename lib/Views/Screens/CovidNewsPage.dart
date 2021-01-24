import 'package:flutter/material.dart';

import '../../API Functions/CovidNewsApi.dart';
import '../ComponentWidgets/ResultsCard.dart';
import '../ComponentWidgets/Spinkit.dart';

class CovidNewsPage extends StatelessWidget {

  CovidNewsPage({@required this.countryName});

  final String countryName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: getData(countryName),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget myReturn;
        if (snapshot.hasData) {
          myReturn =  Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),),
              child:Scaffold(
            backgroundColor: Color(0xffF8F8F4).withOpacity(0),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResultCard(height: height, width: width,dataName: 'New\nCases',theData: '${snapshot.data['casesNew']}',),
                    ResultCard(height: height, width: width,dataName: 'Active\nCases',theData: '${snapshot.data['casesActive']}',),
                    ResultCard(height: height, width: width,dataName: 'Total\nCases',theData: '${snapshot.data['casesTotal']}',),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResultCard(height: height, width: width,dataName: 'Recovered\nCases',theData: '${snapshot.data['casesRecovered']}',),
                    ResultCard(height: height, width: width,dataName: 'Total\nDeath',theData: '${snapshot.data['deathsTotal']}',),
                    ResultCard(height: height, width: width,dataName: 'New\nDeath',theData: '${snapshot.data['deathsNew']}',),
                  ],
                ),
              ],
            ),
          ));
        }
        else if (snapshot.hasError) {
          myReturn = Center(child: Text('error'));
        }
        else {
          myReturn =  Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff83a4d4), Color(0xffb6fbff)]),),
        child:Scaffold(
          backgroundColor: Color(0xffF8F8F4).withOpacity(0),
            body: spanner,
          ));
        }
        return myReturn;
      },
    );
  }
}



