import 'package:flutter/material.dart';

class TapPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.home, size: 200.0, color: Colors.white,),
          Text('data1', style:  TextStyle(color: Colors.white),)
        ],
      ),
      color: Colors.deepOrangeAccent,
    );
  }
}