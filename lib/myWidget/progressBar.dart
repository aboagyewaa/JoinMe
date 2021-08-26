import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  late String message;
  ProgressBar({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF9C560B),
      child: Container(
        margin: EdgeInsets.all(18.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            SizedBox(width: 6.0),
            CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
            SizedBox(width: 6.0,),

            Text(
              message,
              style: TextStyle(color:Colors.black,fontSize: 12.0),
            ),
          ],
        ),
      ),

    );
  }
}
