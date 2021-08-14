import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                    child: Text("Payment cards"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
            height: 120.0,
            child: Image.asset("assets/images/master.png"),
          ),
          Text(
            "You haven't added the cards yet",
            style: TextStyle(fontSize: 20.0, color: Colors.grey.shade600),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0),
            width: 380.0,
            height: 50.0,
            child: TextButton(
              onPressed: () {},
              child: Text("Add a card",style: TextStyle(color: Colors.grey.shade700),),
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
