import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldDataSource extends StatefulWidget {
  @override
  _WorldDataSourceState createState() => _WorldDataSourceState();
}

class _WorldDataSourceState extends State<WorldDataSource> {
  Map mapResponse;
  String casesWorld = 'loading';
  String casesTodayWorld = 'loading';
  String activeWorld = 'loading';
  String deathsTodayWorld = 'loading';
  String deathsTotalWorld = 'loading';
  String populationWorld = 'loading';

  Widget getText(String parameter, String numberOfIt) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          Text(
            "$parameter :",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            numberOfIt,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  fetchData() async {
    var response = await http.get(
      Uri.parse('https://disease.sh/v3/covid-19/all'),
    );
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      setState(() {
        casesWorld = mapResponse["cases"].toString();
        casesTodayWorld = mapResponse["todayCases"].toString();
        activeWorld = mapResponse["active"].toString();
        deathsTodayWorld = mapResponse["todayDeaths"].toString();
        deathsTotalWorld = mapResponse["deaths"].toString();
        populationWorld = mapResponse["population"].toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getText("Total Cases", casesWorld),
        getText("Cases Today", casesTodayWorld),
        getText("Active", activeWorld),
        getText("Deaths Today", deathsTodayWorld),
        getText("Total Deaths", deathsTotalWorld),
        getText("Total Population", populationWorld),
        SizedBox(
          height: 20,
        ),
        RaisedButton.icon(
          onPressed: fetchData,
          icon: Icon(Icons.refresh),
          label: Text('Refresh'),
          highlightColor: Colors.blue,
        )
      ],
    );
  }
}
