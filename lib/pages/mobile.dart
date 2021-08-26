import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:join_me/pages/otp.dart';

import 'menu.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(AuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        //Navigator.push(
       // context, MaterialPageRoute(builder: (context) => Otp()));
        Navigator.pushNamed(context, '/otp');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      print(e.message);
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                print(verificationFailed.message);
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("SEND"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileFormWidget(context)
              : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}





// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'otp.dart';
//
// class Mobile extends StatefulWidget {@override
//   _MobileState createState() => _MobileState();
// }
//
// class _MobileState extends State<Mobile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//            children:<Widget> [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//
//                   child: TextField(
//                     //controller: _phoneController,
//
//                     decoration: InputDecoration(labelText: 'ENTER MOBILE NUMBER',
//                     icon: Icon(Icons.call,
//                       color: Colors.deepOrange,
//                     ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     inputFormatters:<TextInputFormatter>
//                     [FilteringTextInputFormatter.digitsOnly],
//                    ),
//                 ),
//                   SizedBox(height:20.0),
//              Text('By continuing, I have agree to the Terms & conditions',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 12,
//                  wordSpacing: 2.0,
//                ),
//
//              ),
//             SizedBox(height:40.0),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//
//                children: [
//                  ElevatedButton(
//                    onPressed: (){
//                      Navigator.pushNamed(context,'/otp');
//                    },
//
//                    child:Text('Continue',
//                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//                        shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Color(0xFFFFFFFFF))),
//                  ),
//                ],
//              ),
//            ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }