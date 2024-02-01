import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/widgets/users_data_list.dart';

import '../methods/common_methods.dart';

class UsersPage extends StatefulWidget {
  static const String id='\webPageUsers';
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  CommonMethods cMethods = CommonMethods();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Manage Users',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  cMethods.header(2, 'User ID'),
                  cMethods.header(1, 'Name'),
                  cMethods.header(1, 'Email'),
                  cMethods.header(1, 'Phone'),
                  cMethods.header(1, 'Action'),
                ],
              ),
              //display data
              UsersDataList(),
            ],
          ),
        ),
      ),
    );
  }
}