import 'package:flutter/material.dart';
class Email extends StatefulWidget {


  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              Column(
                children: [

                  Text('SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
                  ),
                  SizedBox(height: 20),
                  Text('EMAIL',
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
                      // controller: _cityTextController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Email'.toUpperCase(),
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

