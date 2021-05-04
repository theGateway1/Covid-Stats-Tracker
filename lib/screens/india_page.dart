import 'package:covid_tracker_api/screens/indiadatasource.dart';
import 'package:covid_tracker_api/screens/worlddatasource.dart';
import 'package:flutter/material.dart';

class IndiaPage extends StatefulWidget {
  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  bool countsr = true;

  void changeColor() {
    setState(() {
      countsr = !countsr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Stats: India',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                FlatButton.icon(
                  onPressed: changeColor,
                  icon: Icon(
                    Icons.brush,
                    color: !countsr ? Colors.orange[100] : Colors.green[100],
                    size: 25,
                  ),
                  label: Text(
                    '.',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 330,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  // color: counts ? Colors.white : Colors.red,
                  gradient: countsr
                      ? LinearGradient(colors: [
                          Colors.orange[200],
                          Colors.white,
                          Colors.blue[100],
                          Colors.white,
                          Colors.green[200],
                        ])
                      : LinearGradient(colors: [
                          Colors.yellow[200],
                          Colors.teal[100],
                          Colors.purple[50],
                        ]),
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 50, 30, 0),
                  child: IndiaDetails(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
