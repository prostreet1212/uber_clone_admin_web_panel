import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/widgets/trips_data_list.dart';

import '../methods/common_methods.dart';

class TripsPage extends StatefulWidget {
  static const String id='\webPageTrips';
  const TripsPage({Key? key}) : super(key: key);

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  CommonMethods cMethods = CommonMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Manage Trips',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  cMethods.header(2, 'Trip ID'),
                  cMethods.header(1, 'User name'),
                  cMethods.header(1, 'Driver name'),
                  cMethods.header(1, 'Car details'),
                  cMethods.header(1, 'Timing'),
                  cMethods.header(1, 'Fare'),
                  cMethods.header(1, 'View details'),
                ],
              ),
              //display data
              TripsDataList(),
            ],
          ),
        ),
      ),
    );
  }
}
