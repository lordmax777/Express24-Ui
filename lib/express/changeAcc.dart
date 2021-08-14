import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeAcc extends StatefulWidget {
  @override
  _ChangeAccState createState() => _ChangeAccState();
}

class _ChangeAccState extends State<ChangeAcc> {
  String jins = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 70.0,
              color: Colors.yellow.shade600,
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
                      child: Text("Edit profile"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    "User",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last name",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    "User",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date of birth",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    "##/##/####",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: Colors.yellow,
                      value: "erkak",
                      groupValue: jins,
                      onChanged: (e) {
                        setState(() {
                          jins = e!;
                        });
                      },
                      title: Text("Male"),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: Colors.yellow,
                      value: "ayol",
                      groupValue: jins,
                      onChanged: (e) {
                        setState(() {
                          jins = e!;
                        });
                      },
                      title: Text("Female"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              margin: EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "E-mail",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Text(
                    "****************@gmail.com",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Container(
              width: 380.0,
              height: 50.0,
              child: TextButton(
                onPressed: () {},
                child: Text("Save",style: TextStyle(color: Colors.grey.shade700),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
