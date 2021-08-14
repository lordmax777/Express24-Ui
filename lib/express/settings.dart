import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String jins = "";
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
                    child: Text("Settings"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 270.0),
            child: Text(
              "Language",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          RadioListTile<String>(
            activeColor: Colors.yellow,
            value: "rus",
            groupValue: jins,
            onChanged: (e) {
              setState(() {
                jins = e!;
              });
            },
            title: Text("Русский"),
          ),
          RadioListTile<String>(
            activeColor: Colors.yellow,
            value: "eng",
            groupValue: jins,
            onChanged: (e) {
              setState(() {
                jins = e!;
              });
            },
            title: Text("English"),
          ),
          RadioListTile<String>(
            activeColor: Colors.yellow,
            value: "uzb",
            groupValue: jins,
            onChanged: (e) {
              setState(() {
                jins = e!;
              });
            },
            title: Text("O'zbek"),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            width: 380.0,
            height: 50.0,
            child: TextButton(
              onPressed: () {},
              child: Text("Save",style: TextStyle(color: Colors.grey.shade600),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
