import 'package:flutter/cupertino.dart';
import 'package:join_me/models/address.dart';

class AppData extends ChangeNotifier
{
late Address pickUpLocation, dropOffLocation;

void updatePickUpLocationAddress(Address pickUpAddress)
{
  pickUpLocation = pickUpAddress;
  notifyListeners();
}
void updateDropOffLocationAddress(Address dropOffAddress)
{
  dropOffLocation = dropOffAddress;
  notifyListeners();
}
}