import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:join_me/myWidget/divider.dart';

import '../main.dart';
import 'dart:math';

Random random = new Random();
int randomNumber = (random.nextInt(9)%2);


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

class Notif extends StatefulWidget {
  final String title;
  Notif({ required this.title});


  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Color(0xFF9C560B),
                playSound: true,
                icon: '@mipmap/@mipmap/taxi_40px',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('notification.title'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('notification.body')],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Welcome To JOIN ME.",
        "Your Ride Has Been Requested Successfully."
            "Please, you can share Your Requested Ride with Friends, Family and colleague."
            "Regards, JOIN ME TEAM",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name, channel.description,
                importance: Importance.high,
                color: Color(0xFF9C560B),
                playSound: true,
                icon: '@mipmap/taxi_40px')));
  }

   @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          heightFactor: 1.8,
          child: Column(
            children:[
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/suv.png", height: 70.0, width: 70.0,),
                          SizedBox(width: 16.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "We have $randomNumber Car Available" , style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand-bold",
                                color: Colors.black,
                              ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                "Price Is Negotiable With A Driver" , style: TextStyle(
                                fontSize: 12.0, fontFamily: "Brand-bold",
                                color: Color(0xFF9C560B),
                              ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

           Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
            Text(
          '',
              ),
             ],
           ),
              DividerLine(),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  // children: [
                  //   Icon(FontAwesomeIcons.moneyCheckAlt, size: 18.0,
                  //     color: Colors.black45,),
                  //   SizedBox(width: 16.0,),
                  //   Icon(Icons.keyboard_arrow_down, color: Colors.black54,size: 16.0,),
                  // ],
                ),
              ),
              SizedBox(height: 24.0,),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      child: Text('Request Ride'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF9C560B),
                        minimumSize: Size.fromRadius(20.0),
                      ),
                      onPressed: showNotification,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Cancel Ride'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9C560B),
                      minimumSize: Size.fromRadius(20.0),
                    ),
                    onPressed:(){
                      Navigator.pushNamed(context,'/menu');
                    }
                  ),
                ],
              ),
              DividerLine(),
            ],
          ),
        ),
      ),
    );
  }
}
