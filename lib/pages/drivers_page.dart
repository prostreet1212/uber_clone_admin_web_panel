import 'package:flutter/material.dart';

class DriversPage extends StatefulWidget {
  static const String id='\webPageDrivers';
  const DriversPage({Key? key}) : super(key: key);

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('driver page',
          style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 24
          ),
        ),
      ),
    );
  }
}