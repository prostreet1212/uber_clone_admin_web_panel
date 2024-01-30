import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  static const String id='\webPageUsers';
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('user page',
          style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 24
          ),
        ),
      ),
    );
  }
}