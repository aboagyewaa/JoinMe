import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:join_me/myWidget/progressBar.dart';
import 'package:join_me/pages/username.dart';

import '../main.dart';

class Sign extends StatefulWidget {

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Column(
                  children: [
                    Text('sign in'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                     SizedBox(height:12.0),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller:  emailTextEditingController,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,fontStyle: FontStyle.italic,),
                          hintText: 'enter email'.toUpperCase(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.amber,
                      ),
                    ),
                    //password
                    // SizedBox(height: 12),
                    // Text('enter Password'.toUpperCase(),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 14.0,
                    //   ),
                    // ),
                    SizedBox(height:12.0),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller:  passwordTextEditingController,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                          hintText: 'enter password'.toUpperCase(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(!emailTextEditingController.text.contains("@")){
                              displayToastMessage("Email address is not valid", context);
                            }
                            else if(passwordTextEditingController.text.isEmpty){
                              displayToastMessage("password required", context);
                            }
                            else {
                              loginAuthenticateUser(context);
                            }
                             },
                          child:Text('LOGIN',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                              shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Color(0xFFFFFFFFF))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

 void loginAuthenticateUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
       return ProgressBar(message: "Please Wait...");
      }
    );
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final User? firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
    email: emailTextEditingController.text, password:passwordTextEditingController.text).catchError((errmsg){
      Navigator.pop(context);
      displayToastMessage("Error: " + errmsg.toString(), context);
    })).user;

    if(firebaseUser != null){
//successful save user
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value !=null){
          displayToastMessage("Login Successfully", context);
         Navigator.pushNamedAndRemoveUntil(context,'/menu', ModalRoute.withName('/'));
        }
        else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("Invalid Account", context);
        }
      });
}
    else{
//error occur
      Navigator.pop(context);
      displayToastMessage("Error Occur. Can't Sign in", context);
    }
  }
}

