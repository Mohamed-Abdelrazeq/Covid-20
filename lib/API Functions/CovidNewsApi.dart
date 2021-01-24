import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}