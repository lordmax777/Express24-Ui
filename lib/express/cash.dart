import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cash extends StatefulWidget {
  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
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
                    child: Text("Cashback"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25.0),
            height: 165.0,
            width: 370.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "1%",
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("From 0 orders")
                    ],
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25.0),
            height: 165.0,
            width: 370.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "2%",
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      Container(
                        child: Text(
                          "From 11 orders",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              "The cashback status is updated once a month.",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
