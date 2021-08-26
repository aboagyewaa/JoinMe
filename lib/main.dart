import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:join_me/dataHandler/appData.dart';
import 'package:join_me/pages/email.dart';
import 'package:join_me/pages/mobile.dart';
import 'package:join_me/pages/searchScreen.dart';
import 'package:join_me/pages/signin.dart';
import 'package:join_me/pages/create.dart';
import 'package:join_me/pages/home.dart';
import 'package:join_me/pages/otp.dart';
import 'package:join_me/pages/name.dart';
import 'package:join_me/pages/splash.dart';
import 'package:join_me/pages/username.dart';
import 'package:join_me/pages/menu.dart';
import 'package:join_me/pages/driver.dart';
import 'package:join_me/pages/welcome.dart';
import 'package:join_me/pages/notification.dart';
import 'package:provider/provider.dart';




final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("Users");
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(

        //initialRoute: FirebaseAuth.instance.currentUser == null? '/' : '/createAccount',
        initialRoute: '/splash',
          routes: {
          //'/': (context) => LoadingPage(),
          '/splash': (context) => Splash(),
          '/home': (context) => Home(),
          '/createAccount': (context) => CreateAccount(),
          '/mobile': (context) => Mobile(),
          '/otp': (context) => Otp(),
          '/email': (context) => Email(),
          '/name': (context) => Name(),
          '/username': (context) => Username(),
          '/signin': (context) => Sign(),
          '/menu': (context) => Menu(),
          '/driver': (context) => Driver(),
          '/congrats': (context) => Congratulation(),
          '/searchScreen': (context) => SearchScreen(),
          '/notification': (context) => Notif(title: '',),
         // '/requestRide': (context) => RequestRide(),
        },
      ),
    );
  }
}

//initialRoute: FirebaseAuth.instance.currentUser == null? '/' : '/createAccount',
//initialRoute: '/mobile',
//
// class myApp extends statelessWidget{
//     return MaterialApp(
//
//
//       routes: {
//         '/': (context) => LoadingPage(),
//         '/home': (context) => Home(),
//         '/createAccount': (context) => CreateAccount(),
//         '/mobile': (context) => Mobile(),
//         '/otp': (context) => Otp(),
//         '/email': (context) => Email(),
//         '/name': (context) => Name(),
//         '/username': (context) => Username(),
//         '/signin': (context) => Sign(),
//         '/menu': (context) => Menu(),
//         '/driver': (context) => Driver(),
//         '/congrats': (context) => Congratulation(),
//       },
// //     ));
//   }

//   //otp verification and phone number
// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }
//
// class _InitializerWidgetState extends State<InitializerWidget> {
//   late FirebaseAuth _auth;
//   late User? _user;
//   bool isLoading = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser;
//     isLoading = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     )
//         : _user == null
//         ? Otp()
//         : Mobile();
//   }
// }
