import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  static const String id='\webPageTrips';
  const TripsPage({Key? key}) : super(key: key);

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('trips',
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: 24
        ),
        ),
      ),
    );
  }
}
