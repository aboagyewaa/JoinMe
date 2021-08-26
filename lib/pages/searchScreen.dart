import 'package:flutter/material.dart';
import 'package:join_me/myWidget/divider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 230.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    )
                  ]

              ),
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0, bottom: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0,),
                    Stack(
                      children: [
                        GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                        Center(
                          child: Text('Set Drop Off', style:
                          TextStyle(
                              fontSize: 18.0, fontFamily: "Brand-Bold"
                          ),),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Image.asset("assets/marker_48px.png", height: 20.0,width: 20.0,),
                        SizedBox(width: 10.0),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                controller: pickUpTextEditingController,
                                decoration: InputDecoration(
                                  hintText:"Pickup Location",
                                  fillColor: Colors.grey,
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Image.asset("assets/destination.png", height: 20.0,width: 20.0,),
                        SizedBox(width: 10.0),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: TextField(
                                controller: dropOffTextEditingController,
                                decoration: InputDecoration(
                                  hintText:"Where To?",
                                  fillColor: Colors.grey,
                                  filled: true,
                                  border: InputBorder.none,
                                   isDense: true,
                                  contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pushNamedAndRemoveUntil(context,'/notification', ModalRoute.withName('/menu'));
                            },
                          child: Row(
                            children: [

                              Icon(Icons.person_search_outlined,),

                              Text('Find Ride',),
                             ]
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Row(
                          children: [
                            IconButton(onPressed: (){},
                              icon: Icon(Icons.share),
                            ),
                            Text('Share Ride',),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DividerLine(),
          ],
        ),
      ),
    );
  }
  // void finalPlace(String placeName) async
  // {
  //   if(placeName.length > 1){
  //     String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=1600+Amphitheatre&key=<API_KEY>&sessiontoken=1234567890https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890";
  //  var res = await RequestAssistant.getRequest(autoCompleteUrl);
  //  if(res == 'failed'){
  //    return;
  //  }
  //  print("places Predictions response");
  //  print(res);
  //   }
  }


