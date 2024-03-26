import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/methods/common_methods.dart';

class UsersDataList extends StatefulWidget {
  const UsersDataList({Key? key}) : super(key: key);

  @override
  State<UsersDataList> createState() => _UsersDataListState();
}

class _UsersDataListState extends State<UsersDataList> {
  final usersRecordsFromDataBase =
  FirebaseDatabase.instance.ref().child('users');
  CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: usersRecordsFromDataBase.onValue,
        builder: (context, snapshotData) {
          if (snapshotData.hasError) {
            return Center(
              child: Text(
                'Error Occurred. Try later',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.pink,
                ),
              ),
            );
          }
          ;
          if (snapshotData.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          ;
          Map dataMap = snapshotData.data!.snapshot.value as Map;
          List itemList = [];
          dataMap.forEach((key, value) {
            itemList.add({'key': key, ...value});
          });
          return ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cMethods.data(2, Text(itemList[index]['id'].toString())),
                    cMethods.data(1, Text(itemList[index]['name'].toString())),
                    cMethods.data(1, Text(itemList[index]['email'].toString())),
                    cMethods.data(1, Text(itemList[index]['phone'].toString())),
                    cMethods.data(1,
                      itemList[index]['blockStatus']=='no'?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade500,
                        ),
                        child: Text('Block',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: ()async{
                          await FirebaseDatabase.instance.ref()
                              .child('users')
                              .child(itemList[index]['id'])
                              .update(
                              {
                                'blockStatus': 'yes'
                              }
                          );
                        },
                      )
                          :ElevatedButton(
                        child: Text('Approve',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: ()async{
                          await FirebaseDatabase.instance.ref()
                              .child('users')
                              .child(itemList[index]['id'])
                              .update(
                              {
                                'blockStatus': 'no'
                              }
                          );
                        },
                      ),),


                  ],
                );
              });
        });
  }
}