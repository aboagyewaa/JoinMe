import 'dart:ui';

import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icon.png',
        width: 300,),
automaticallyImplyLeading: false,
        toolbarHeight: 150,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(

            decoration:  BoxDecoration(
              image:  DecorationImage(
                image:  ExactAssetImage('assets/account.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child:  BackdropFilter(
                filter:  ImageFilter.blur(sigmaX:10.0, sigmaY: 10.0),
                child:  Container(
                  decoration:  BoxDecoration(color: Colors.white60.withOpacity(0.1)),
                ),
              ),
            ),

          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 ElevatedButton(
                   onPressed: (){
                     Navigator.pushNamed(context,'/username');
                   },

                   child:Text('Sign Up',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                   style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                       shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Color(0xFFFFFFFFF))),
                 ),
                  //second button
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/signin');
                    },
                    child:Text('Log In',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: StadiumBorder(),primary: Color(0xFF9C560B),
                    side: BorderSide(color: Color(0xFFFFFFFFF))),
                  ),

                ],
              ),
            ),

          )

          ],

      ),
    );
  }

}


