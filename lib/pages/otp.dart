import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:join_me/pages/menu.dart';
import 'package:join_me/pages/mobile.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Menu()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// class Otp extends StatefulWidget {
//   @override
//   _OtpState createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
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
//             mainAxisAlignment: MainAxisAlignment.start,
//             children:<Widget> [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                  Text('OTP VERIFICATION',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                    ),
//                   SizedBox(height:20.0),
//                   Text('Enter the 4-digit code sent ',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 12.0,
//                     letterSpacing: 0.3,
//                   ),
//                   ),
//                   SizedBox(height: 15.0),
//                   Text('0245045867'),
//                   GestureDetector(
//                     child: Text('edit',
//                     style: TextStyle(decoration: TextDecoration.underline,
//                     color: Colors.blue,fontSize: 18.0),),
//                     onTap: (){
//                       Navigator.pushNamed(context, '/mobile');
//                     }
//                   ),
//                 ],
//               ),
//               Column(
//
//                 children: [
//                   OTPTextField(
//                     length: 4,
//                     width: MediaQuery.of(context).size.width,
//                     fieldWidth: 40,
//                     style: TextStyle(
//                         fontSize: 17
//                     ),
//                     textFieldAlignment: MainAxisAlignment.spaceAround,
//                     fieldStyle: FieldStyle.underline,
//                     onCompleted: (pin) {
//                       print("Completed: " + pin);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height:20.0),
//               Text('By continuing, I have agree to the Terms & conditions',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12,
//                   wordSpacing: 2.0,
//                 ),
//
//               ),
//               SizedBox(height:40.0),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//
//                 children: [
//                   ElevatedButton(
//                     onPressed: (){
//                       Navigator.pushNamed(context,'/signin');
//                     },
//
//                     child:Text('Continue',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                     style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//                         shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Color(0xFFFFFFFFF))),
//                   ),
//                   // SizedBox(height: 20),
//                   // GestureDetector(
//                   //     child: Text('resend',
//                   //       style: TextStyle(decoration: TextDecoration.underline,
//                   //           color: Colors.blue,
//                   //       fontSize: 18.0),),
//                   //     onTap: (){
//                   //       Navigator.pushNamed(context, '/signin');
//                   //     }
//                   // )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
