import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Driver extends StatefulWidget {@override
_DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
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
              Text('Legal and pricing details',
              style:TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10),
              Text('Your national ID and license details will be kept safe.',
                style:TextStyle(fontSize: 14.0,  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Driver License Number',
                    icon: Icon(Icons.local_police_outlined,
                      color: Colors.deepOrange,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters:<TextInputFormatter>
                  [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(height:20.0),
              Text('By continuing, I have agree to the Terms & conditions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  wordSpacing: 2.0,
                ),
              ),
              SizedBox(height:20.0),
              SizedBox(height:10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/congrats');
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
        ),
      ),
    );
  }
}



