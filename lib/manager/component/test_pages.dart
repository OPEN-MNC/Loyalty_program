import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _position;
  // late GoogleMapController mapController;
  // LatLng initialCameraPosition =
  //     const LatLng(20.5937, 78.9629); // Default initial position

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabeled;
    LocationPermission permission;

    serviceEnabeled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabeled) {
      Fluttertoast.showToast(msg: "location services is deabeled");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "You denied the permition");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "You denied the permition for ever");
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    debugPrint(currentPosition.toString());
    setState(() {
      _position = currentPosition;
      debugPrint(_position.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng initialCameraPosition = _position != null
        ? LatLng(_position!.latitude, _position!.longitude)
        : LatLng(20.512, -72.56); // Default to 0,0 if _position is null
    return Scaffold(
      // body: GoogleMap(
      //   onMapCreated: (GoogleMapController controller) {
      //     mapController = controller;
      //   },
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(20.512, -72.56),
      //     zoom: 14.0,
      //   ),
      // ),
      body: Center(
        child: Text(_position.toString()),
      ),
    );
  }
}
