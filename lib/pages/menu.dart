import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:join_me/assistance/assistanceMethod.dart';
import 'package:join_me/dataHandler/appData.dart';
import 'package:join_me/myWidget/divider.dart';
import 'package:join_me/myWidget/progressBar.dart';
import 'package:provider/provider.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();

late Position currentPosition;
var geolocator = Geolocator();
double bottomPaddingOfMap = 0;


void LocatePosition() async{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  currentPosition = position;


  LatLng latLatPosition = LatLng(position.latitude, position.longitude);

  CameraPosition cameraPosition = new CameraPosition(target: latLatPosition, zoom: 14);
  newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));


  String address = await AssistantMethods.searchCoordinateAddress(position, context);
  print("this is your address ::" + address);
}

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 15.0,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: ScaffoldKey,
        body: Stack(
          //VisualDensity: VisualDensity.adaptivePlatformDensity,
          children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller){
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                setState(() {
                  bottomPaddingOfMap = 300.0;
                });

                LocatePosition();
              },
            ),
            //hamburger button for drawer.
            Positioned(
              top:38.0,
              left: 22.0,
              child: GestureDetector(
                onTap:(){
                  ScaffoldKey.currentState!.openDrawer();
              },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 6.0,
                        spreadRadius:0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF9F673E),
                    child: Icon(Icons.menu, color: Colors.black),
                    radius: 20.0,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                  height: 255.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                 borderRadius: BorderRadius.circular(12.0),
                 // borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                  boxShadow:[
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ]
                ),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi there',
                      style: TextStyle(fontSize: 12.0, fontWeight:FontWeight.bold),),
                      Text('Where to?',
                        style: TextStyle(fontSize: 16.0, fontFamily: "Brand-Bold"),),
                      SizedBox(height: 10.0,),

                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context,'/searchScreen', ModalRoute.withName('/menu'));
                           },
                         child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7),
                                ),
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Color(0xFFAC7439)),
                                SizedBox(height: 4.0,),
                                Text('Search Drop Off', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Icon(Icons.home, color: Colors.grey,),
                          SizedBox(width:12.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                 // Provider.of<appData>(context).pickUpLocation !=null
                                 //    ?  Provider.of<appData>(context).pickUpLocation.placeName
                                 //     : "Add Home",
                                "Location:"
                              ),
                              SizedBox(height: 7.0,),
                              Text('Your Living home address', style:
                                TextStyle(color: Colors.black, fontSize: 14.0),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0,),
                      DividerLine(),
                      Row(
                        children: [
                          Icon(Icons.work, color: Colors.grey,),
                          SizedBox(width:16.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Work:'),
                              SizedBox(height: 4.0,),
                              Text('Your Office address', style:
                              TextStyle(color: Colors.black, fontSize: 16.0),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ) ,
              ),
            ),
           // requestRider(),
          ],
        ),
          drawer: Container(
            color: Colors.white,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Drawer(
                child: ListView(
                  children:[
                    Container(
                      height: 150.0,
                      child: DrawerHeader(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          children: [
                            Image.asset('assets/male.png', height:100.0, width: 100.0,),
                            SizedBox(width: 6.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Profile Name', style: TextStyle(fontSize: 16.0),),
                              SizedBox(height: 6.0,),
                              Text('Visited Profile'),
                              ]
                            )
                          ],
                        ),
                      ),
                    ),
                    //drawer Body
                    DividerLine(),
                     SizedBox(height: 12.0,),
                    ListTile(
                        leading: Icon(Icons.summarize_outlined),
                        title: Text('History', style: TextStyle(fontSize: 16.0),),
              ),
                    ListTile(
                      leading: Icon(Icons.taxi_alert),
                      title: Text('Notifications', style: TextStyle(fontSize: 16.0),),
              ),
                    ListTile(
                      onTap: (){
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context,'/createAccount', ModalRoute.withName('/'));
                        },
                     leading: Icon(Icons.exit_to_app_outlined),
                     title: Text('Log out', style: TextStyle(fontSize: 16.0),),
              ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context,'/driver');
                          },

                          child:Text('Sign Up to Drive',
                            style: TextStyle(fontSize:14, fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 35, vertical: 7),
                              shape: StadiumBorder(),primary: Color(0xFF9C560B),side: BorderSide(color: Color(0xFFFFFFFFF))),
                        ),
                      ],
                    ),
                      ],
                    ),
                  ),
            ),
            ),
      ),
    );
  }
  Future <void> getPlaceDirection()async {
    var initialpos = Provider
        .of<AppData>(context, listen: false)
        .pickUpLocation;
    var finalpos = Provider
        .of<AppData>(context, listen: false)
        .dropOffLocation;

    var pickUpLapLang = LatLng(initialpos.latitude, initialpos.longitude);
    var dropOffLapLang = LatLng(finalpos.latitude, finalpos.longitude);

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ProgressBar(message: "please wait...",)
    );

    var details = await AssistantMethods.obtainDirectionDetails(
        pickUpLapLang, dropOffLapLang);

    Navigator.pop(context);
    print('This is Encoded Points::');
    print(details!.encodedPoints);
  }
}


