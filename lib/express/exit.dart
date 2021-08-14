import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exit extends StatefulWidget {
  @override
  _ExitState createState() => _ExitState();
}

class _ExitState extends State<Exit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70.0,
            color: Colors.yellow,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(CupertinoIcons.arrow_left, size: 30.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 120.0),
                    child: Text("Authorization"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, top: 35.0),
            child: Row(
              children: [
                Text(
                  "+998",
                  style: TextStyle(fontSize: 30.0, color: Colors.grey),
                ),
                Text(
                  " ( ** ) *** ** **",
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 130.0, top: 20.0),
              child: Text(
                "By clicking 'Get a code', I accept",
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            margin: EdgeInsets.only(right: 255.0),
            child: Text("Terms of use"),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            width: 340.0,
            height: 50.0,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "GET A CODE",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 440.0),
            child: Column(
              children: [
                Text(
                  "Support service",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "+99871 202-65-00",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text("Version 1.17.10 (production)"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
