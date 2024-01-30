import 'package:flutter/material.dart';

class CommonMethods{

  Widget header(int headerFlexValue, String headerTitle) {
    return Expanded(
        flex: headerFlexValue,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.pink.shade500,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              headerTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

}