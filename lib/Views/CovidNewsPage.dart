import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flip_card/flip_card.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    @required this.height,
    @required this.width,
    @required this.theData,
    @required this.dataName,
  }) : super(key: key);

  final double height;
  final double width;
  final String theData;
  final String dataName;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        height: height*.3,
        width: width*.45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(height*.01)
        ),
        child: Center(
          child: Text(
            dataName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height*.03,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
          ),
        ),
      ),
      back: Container(
        height: height*.3,
        width: width*.45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(height*.01)
        ),
        child: Center(
          child: Text(
            theData,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height*.03,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
          ),
        ),
      ),
    );

  }
}

Future<Map> getData(String countryName) async {
  //URL
  String url = "https://covid-193.p.rapidapi.com/statistics";
  //Keys --headers
  Map<String, String> body = {
    'x-rapidapi-key': "36a2e26b45msh809325bed92fff7p10a609jsn8d0d53f73ab5",
    'x-rapidapi-host': "covid-193.p.rapidapi.com"
  };
  //Create request using http package
  http.Response response = await http.get(url, headers:body);
  //decode the results
  var jsonResponse = convert.jsonDecode(response.body);
  //check the request status TODO try this
  // print('Response status: ${response.body}');
  //get list of the data I want --TODO try to print after every step to see your data and parse it yourself
  var myList = jsonResponse['response'];
  var egypt ;
  //search for country name
  for (int i = 0; i<myList.length;i++){
    if (myList[i]['country'] == countryName.capitalize()){
      egypt = myList[i];
    }
  }
  //more parsing
  Map cases = egypt['cases'];
  var casesActive     = cases['active'];
  var casesNew        = cases['new'];
  var casesRecovered  = cases['recovered'];
  var casesTotal      = cases['total'];
  //more parsing
  Map deaths = egypt['deaths'];
  var deathsNew = deaths['new'];
  var deathsTotal = deaths['total'];
  //returned data
  return {
    'casesActive'   :'$casesActive',
    'casesNew'      :'$casesNew',
    'casesRecovered':'$casesRecovered',
    'casesTotal'    :'$casesTotal',
    'deathsNew'     :'$deathsNew',
    'deathsTotal'   :'$deathsTotal',
  };
}

var spanner = SpinKitRotatingCircle(
  color: Colors.black54,
  size: 50.0,
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}