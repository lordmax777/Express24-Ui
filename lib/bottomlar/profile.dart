import 'package:express24/express/cash.dart';
import 'package:express24/express/changeAcc.dart';
import 'package:express24/express/exit.dart';
import 'package:express24/express/payment.dart';
import 'package:express24/express/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile(PageStorageKey<String> keysettings);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 214.0,
              color: Colors.yellow,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 45.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        Text(
                          "User",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text("+998 (**) *** ** **"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Icon(CupertinoIcons.rosette, size: 30.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Current balance: 0 points",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              margin: EdgeInsets.only(right: 150.0,top: 10.0),
              child: Text(
                "General information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeAcc()));
                },
                splashColor: Colors.blue,
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.pencil_ellipsis_rectangle,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  title: Text(
                    "User",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Change account information"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(),
                    ),
                  );
                },
                splashColor: Colors.pink,
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.macwindow,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  title: Text(
                    "Payment cards",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Add payment card"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cash()));
                },
                splashColor: Colors.yellow,
                child: ListTile(
                  leading: Icon(Icons.clean_hands_outlined,
                      color: Colors.black, size: 30.0),
                  title: Text(
                    "Cashback",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Find out your cashback status"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                splashColor: Colors.grey,
                child: Container(
                  child: ListTile(
                    leading: Icon(
                      CupertinoIcons.settings,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    subtitle: Text("App language"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Exit()));
                },
                splashColor: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  title: Text(
                    "Exit",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                "Support service",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "+99871 202-65-00",
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text("Version 1.17.10 (production)"),
            ),
          ],
        ),
      ),
    );
  }
}
