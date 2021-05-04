import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndiaDetails extends StatefulWidget {
  @override
  _IndiaDetailsState createState() => _IndiaDetailsState();
}

class _IndiaDetailsState extends State<IndiaDetails> {
  Map mapResponse;
  String casesIndia = 'loading';
  String casesTodayIndia = 'loading';
  String activeIndia = 'loading';
  String deathsTodayIndia = 'loading';
  String deathsTotalIndia = 'loading';
  String populationIndia = 'loading';

  Widget getText(String parameter, String numberOfIt) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          SelectableText(
            "$parameter :",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          SelectableText(
            numberOfIt,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  fetchDataIndia() async {
    var response = await http.get(
      Uri.parse('https://disease.sh/v3/covid-19/countries/india'),
    );
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      setState(() {
        casesIndia = mapResponse["cases"].toString();
        casesTodayIndia = mapResponse["todayCases"].toString();
        activeIndia = mapResponse["active"].toString();
        deathsTodayIndia = mapResponse["todayDeaths"].toString();
        deathsTotalIndia = mapResponse["deaths"].toString();
        populationIndia = mapResponse["population"].toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchDataIndia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getText("Total Cases", casesIndia),
        getText("Cases Today", casesTodayIndia),
        getText("Active", activeIndia),
        getText("Deaths Today", deathsTodayIndia),
        getText("Total Deaths", deathsTotalIndia),
        getText("Total Population", populationIndia),
        SizedBox(
          height: 20,
        ),
        RaisedButton.icon(
          onPressed: fetchDataIndia,
          icon: Icon(Icons.refresh),
          label: Text('Refresh'),
          highlightColor: Colors.blue[100],
        )
      ],
    );
  }
}
