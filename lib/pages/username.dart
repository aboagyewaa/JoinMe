import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:join_me/main.dart';
import 'package:join_me/myWidget/progressBar.dart';
class Username extends StatefulWidget {


  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
TextEditingController nameTextEditingController = TextEditingController();
TextEditingController phoneTextEditingController = TextEditingController();
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
                    Text('Create Account'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller:  nameTextEditingController,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Full Name'.toUpperCase(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                      ),
                    ),
                       SizedBox(
                         width: 300,
                       child: TextField(
                        controller:  phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: 'MOBILE NUMBER',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: emailTextEditingController,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'email'.toUpperCase(),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: passwordTextEditingController,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'password'.toUpperCase(),
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
                            if(nameTextEditingController.text.length <4){
                              displayToastMessage("name must be atleast 3 character", context);
                            }
                            else if(!emailTextEditingController.text.contains("@")){
                              displayToastMessage("Email address is not valid", context);
                            }
                            else if(phoneTextEditingController.text.isEmpty){
                              displayToastMessage("Phone Number is required", context);
                            }
                            else if(passwordTextEditingController.text.length < 5){
                              displayToastMessage("More than 3 characters require", context);
                            }
                            else {
                              registerNewUser(context);
                            }
                            // Navigator.pushNamed(context,'/menu');
                            // void _resetToCalendar() {
                            //   Navigator.pushNamedAndRemoveUntil(context, '/menu', ModalRoute.withName('/'));
                            // }
                            //idScreen
                            //Navigator.pushNamedAndRemoveUntil(context, "/menu", (Route<dynamic> route) => false);
                            },

                          child:Text('Create User',
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


void registerNewUser(BuildContext context) async{
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return ProgressBar(message: "Registering User...");
      }
  );
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 final User? firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
     email: emailTextEditingController.text, password:passwordTextEditingController.text).catchError((errmsg){
       Navigator.pop(context);
    displayToastMessage("Error: " + errmsg.toString(), context);
  })).user;

  if(firebaseUser != null){
//successful save user
  usersRef.child(firebaseUser.uid);
  Map userDataMap = {
    "name": nameTextEditingController.text.trim(),
    "email": emailTextEditingController.text.trim(),
    "phone": phoneTextEditingController.text.trim(),

  // Navigator.pushName(context, '/otp'),
  };
  usersRef.child(firebaseUser.uid).set(userDataMap);
 displayToastMessage("Account Created Successfully", context);
 Navigator.pushNamedAndRemoveUntil(context,'/menu', ModalRoute.withName('/menu'));
 }
  else{
//error occur
    Navigator.pop(context);
  displayToastMessage("New user account has not have Created.", context);
  }

}
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}


