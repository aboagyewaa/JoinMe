import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
         child: Center(
           child: Padding(
             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
             child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   Center(
                     child: Image.asset(
                         'assets/icon.png',
                         height: 200, width: 227),
                   ),
                   SizedBox(height: 30.0),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                     child: Center(
                       child: Text(' WELCOME TO YOUR BEST CARPOOLING APP',
                         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                   ),
                        SizedBox(height: 150.0),
                   Center(
                     child: ElevatedButton(
                         onPressed: (){
                           Navigator.pushNamed(context,'/createAccount');
                         },

                         child:Text('Get Started',
                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                         style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                             shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Colors.black)),
                       ),
                   ),
                  ],
             ),
           ),
         ),
       ),
       );
  }
}
