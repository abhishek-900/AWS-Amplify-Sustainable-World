import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

var currentLocationProvider =
    ChangeNotifierProvider((ref) => CurrentUserLocationProvider());

class CurrentUserLocationProvider with ChangeNotifier {
  String _currentAddress = "Current Location";

  bool _locationLoading = false;
  bool get locationLoading => _locationLoading;
  String get currentAddress => _currentAddress;

  Position? position;

  CurrentUserLocationProvider() {
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    _locationLoading = true;
    notifyListeners();

    final permission = await Permission.location.request();
    if (permission != PermissionStatus.granted) {
      _locationLoading = false;
      notifyListeners();
      return;
    }

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final address = await getAddress(position!.latitude, position!.longitude);
      _currentAddress = address;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }

    _locationLoading = false;
    notifyListeners();
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address =
            '${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
        return address;
      }
    } catch (e) {
      log('Error: ${e.toString()}');
    }

    return '';
  }
}
