import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/methods/common_methods.dart';
import 'package:uber_clone_admin_web_panel/widgets/drivers_data_list.dart';

class DriversPage extends StatefulWidget {
  static const String id = '\webPageDrivers';

  const DriversPage({Key? key}) : super(key: key);

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
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
                  'Manage Drivers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  cMethods.header(2, 'Driver ID'),
                  cMethods.header(1, 'Picture'),
                  cMethods.header(1, 'Name'),
                  cMethods.header(1, 'Car details'),
                  cMethods.header(1, 'Phone'),
                  cMethods.header(1, 'Total earnings'),
                  cMethods.header(1, 'Action'),
                ],
              ),
              //display data
              DriversDataList(),
            ],
          ),
        ),
      ),
    );
  }
}
