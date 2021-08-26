
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:join_me/assistance/requestAsistance.dart';
import 'package:join_me/dataHandler/appData.dart';
import 'package:join_me/models/address.dart';
import 'package:join_me/models/directionDet.dart';
import 'package:join_me/pages/configMaps.dart';
import 'package:provider/provider.dart';

class AssistantMethods
{
static Future<String> searchCoordinateAddress(Position position, context)async
{
String placeAddress = "";
String st1,st2,st3,st4;
String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

var response = await RequestAssistant.getRequest(url);

if(response != "failed"){
 // placeAddress = response["results"][0]["formatted_address"];
  st1 = response["results"][0]["address_components"][3]["long_name"];
  st2 = response["results"][0]["address_components"][4]["long_name"];
  st3 = response["results"][0]["address_components"][5]["long_name"];
  st4 = response["results"][0]["address_components"][6]["long_name"];
 placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;


  Address userPickUpAddress = new Address(placeId: '', placeName: '', latitude: '', longitude: '', placeFormatedAddress: '',);
  userPickUpAddress.longitude = position.longitude;
  userPickUpAddress.latitude = position.latitude;
  userPickUpAddress.placeName = placeAddress;

Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
 }
return placeAddress;
}
static Future<DirectionDetails?>obtainDirectionDetails(LatLng initialPosition, LatLng finalPosition)async
{
   String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapKey";

   var res = await RequestAssistant.getRequest(directionUrl);
   if(res == "failed")
   {
     return null;
   }
   
   DirectionDetails directionDetail = DirectionDetails();
   directionDetail.encodedPoints = res["routes"][0]["overview_polyline"]["points"];
   directionDetail.distanceText = res["routes"][0]["legs"][0]["distance"]["text"];
   directionDetail.distanceValue = res["routes"][0]["legs"][0]["distance"]["value"];

   directionDetail.durationText = res["routes"][0]["legs"][0]["duration"]["text"];
   directionDetail.durationValue = res["routes"][0]["legs"][0]["duration"]["value"];

   return directionDetail;
}
}