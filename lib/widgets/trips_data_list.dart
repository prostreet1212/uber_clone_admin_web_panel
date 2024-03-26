import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone_admin_web_panel/methods/common_methods.dart';
import 'package:url_launcher/url_launcher.dart';

class TripsDataList extends StatefulWidget {
  const TripsDataList({Key? key}) : super(key: key);

  @override
  State<TripsDataList> createState() => _TripsDataListState();
}

class _TripsDataListState extends State<TripsDataList> {
  final completedTripsRecordsFromDataBase =
  FirebaseDatabase.instance.ref().child('tripRequests');
  CommonMethods cMethods = CommonMethods();

  launchGoogleMapFromSourceToDestination(pickUpLat, pickUpLng, dropOffLat, dropOffLng,) async
  {
    String directionAPIUrl = "https://www.google.com/maps/dir/?api=1&origin=$pickUpLat,$pickUpLng&destination=$dropOffLat,$dropOffLng&dir_action=navigate";

    if(await canLaunchUrl(Uri.parse(directionAPIUrl)))
    {
      await launchUrl(Uri.parse(directionAPIUrl));
    }
    else
    {
      throw "Could not lauch google map";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: completedTripsRecordsFromDataBase.onValue,
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
                if(itemList[index]['status']!=null
                    &&itemList[index]['status']=='ended'){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cMethods.data(2, Text(itemList[index]['tripID'].toString())),
                      cMethods.data(1, Text(itemList[index]['userName'].toString())),
                      cMethods.data(1, Text(itemList[index]['driverName'].toString())),
                      cMethods.data(1, Text(itemList[index]['carDetails'].toString())),
                      cMethods.data(1, Text(itemList[index]['psublishDateTime'].toString())),
                      cMethods.data(1, Text('\$'+itemList[index]['fareAmount'].toString())),

                      cMethods.data(1,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade500,
                          ),
                          child: Text('View More',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            String pickUpLat = itemList[index]["pickUpLatLng"]["latitude"];
                            String pickUpLng = itemList[index]["pickUpLatLng"]["longitude"];

                            String dropOffLat = itemList[index]["dropOffLatLng"]["latitude"];
                            String dropOffLng = itemList[index]["dropOffLatLng"]["longitude"];

                            launchGoogleMapFromSourceToDestination(
                              pickUpLat,
                              pickUpLng,
                              dropOffLat,
                              dropOffLng,
                            );
                          },
                        ),),


                    ],
                  );
                }else{
                  return Container();
                }

              });
        });
  }
}