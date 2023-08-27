// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   LatLng initialCameraPosition =
//       LatLng(20.5937, 78.9629); // Default initial position

//   @override
//   void initState() {
//     super.initState();
//     _requestLocationPermission();
//   }

//   Future<void> _requestLocationPermission() async {
//     final permissionStatus = await Permission.locationWhenInUse.request();
//     if (permissionStatus.isGranted) {
//       _getCurrentLocation();
//     }
//   }

//   void _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         initialCameraPosition = LatLng(position.latitude, position.longitude);
//       });
//     } catch (e) {
//       setState(() {
//         // Handle error getting location
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: initialCameraPosition,
//           zoom: 12.0,
//         ),
//       ),
//     );
//   }
// }
