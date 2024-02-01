import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/methods/common_methods.dart';

class DriversDataList extends StatefulWidget {
  const DriversDataList({Key? key}) : super(key: key);

  @override
  State<DriversDataList> createState() => _DriversDataListState();
}

class _DriversDataListState extends State<DriversDataList> {
  final driversRecordsFromDataBase =
      FirebaseDatabase.instance.ref().child('drivers');
  CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: driversRecordsFromDataBase.onValue,
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
                    cMethods.data(1, Image.network(itemList[index]['photo'].toString(),
                    height: 50,width: 50,)),
                    cMethods.data(1, Text(itemList[index]['name'].toString())),
                    cMethods.data(1, Text(itemList[index]['car_details']['carModel'].toString()+' - '+
                        itemList[index]['car_details']['carNumber'].toString())),
                    cMethods.data(1, Text(itemList[index]['phone'].toString())),
                    cMethods.data(1,
                itemList[index]['earnings']!=null?
                        Text('\$ '+itemList[index]['earnings'].toString()):Text('\$ 0')),
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
                        onPressed: (){

                        },
                        )
                        :ElevatedButton(
                  child: Text('Approve',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){

                  },
                ),),


                  ],
                );
              });
        });
  }
}
