
import 'package:flutter/material.dart';
class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  // // final fb = FirebaseDatabase.instance;
  // final _lastNameTextController = TextEditingController();
  // final _firstNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final ref = fb.reference();
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Column(
                  children: [

                    Text('Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(height: 20),
                    Text('First Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height:20.0),
//email input
                    SizedBox(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        // controller: _firstNameTextController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter first Name'.toUpperCase(),
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

                    //second name
                    SizedBox(height: 20),
                    Text('Last Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        // controller: _lastNameTextController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter Last Name'.toUpperCase(),
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
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            // ref.child("firstName").set(_firstNameTextController.text);
                            // ref.child("lastName").set(_lastNameTextController.text);
                            Navigator.pushNamed(context,'');
                          },

                          child:Text('Continue',
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


}
