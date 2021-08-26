import 'package:flutter/material.dart';

class Congratulation extends StatefulWidget {
  const Congratulation({Key? key}) : super(key: key);

  @override
  _CongratulationState createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {
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
              Image(
                image: AssetImage("assets/welcome.png"),
              ),
              Text('Congratulations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  wordSpacing: 2.0,
                ),
              ),
              SizedBox(height:40.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/menu');
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
