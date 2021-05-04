import 'package:covid_tracker_api/screens/datasource.dart';
import 'package:flutter/material.dart';

import 'india_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool counts = true;

  void changeColor() {
    setState(() {
      counts = !counts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => IndiaDetails()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Image.network(
                        "https://disease.sh/assets/img/flags/in.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.2) - 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Worldwide Cases',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                FlatButton.icon(
                  onPressed: changeColor,
                  icon: Icon(
                    Icons.brush,
                    color: !counts ? Colors.pink[100] : Colors.blue[100],
                    size: 25,
                  ),
                  label: Text(''),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  // color: counts ? Colors.white : Colors.red,
                  gradient: counts
                      ? LinearGradient(colors: [
                          Colors.green[100],
                          Colors.purple[100],
                        ])
                      : LinearGradient(colors: [
                          Colors.cyan[100],
                          Colors.purple[50],
                        ]),
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 30, 0),
                  child: WorldDataSource(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
