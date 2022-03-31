// import 'package:cleancityapp2/Modules/DriverPages/Map_Models/directions_model.dart';
// import 'package:cleancityapp2/Modules/DriverPages/Map_Models/directions_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(GMap());
// }

// class GMap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: Location(),
//     );
//   }
// }

// class Location extends StatefulWidget {
//   final AppBar appBar;

//   Location({key, this.appBar}) : super(key: key);
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<Location> {
//   static double lat = 50.0, lon = 35.70234;


//   final initPos = CameraPosition(target: LatLng(lat, lon), zoom: 11.5);

//   // _initialCameraPosition = CameraPosition(
//   //   target: LatLng(lat, lon),
//   //   zoom: 11.5,
//   // );

//   GoogleMapController _googleMapController;
//   Marker _origin;
//   Marker _destination;
//   Directions _info;

//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [

//           if (_origin != null)
//             TextButton(
//               onPressed: () => _googleMapController.animateCamera(
//                 CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                     target: _origin.position,
//                     zoom: 14.5,
//                     tilt: 50.0,
//                   ),
//                 ),
//               ),
//               style: TextButton.styleFrom(
//                 primary: Colors.green,
//                 textStyle: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//               child: Text('ORIGIN'),
//             ),
//           if (_destination != null)
//             TextButton(
//               onPressed: () => _googleMapController.animateCamera(
//                 CameraUpdate.newCameraPosition(
//                   CameraPosition(
//                     target: _destination.position,
//                     zoom: 14.5,
//                     tilt: 50.0,
//                   ),
//                 ),
//               ),
//               style: TextButton.styleFrom(
//                 primary: Colors.blue,
//                 textStyle: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//               child:  Text('DEST'),
//             )
//       ],),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           GoogleMap(
//             myLocationButtonEnabled: false,
//             mapType: MapType.normal,
//             zoomControlsEnabled: false,
//             initialCameraPosition: initPos,
//             onMapCreated: (controller) => _googleMapController = controller,
//             markers: {
//               if (_origin != null) _origin,
//               if (_destination != null) _destination
//             },
//             polylines: {
//               if (_info != null)
//                 Polyline(
//                   polylineId: PolylineId('overview_polyline'),
//                   color: Colors.red,
//                   width: 5,
//                   points: _info.polylinePoints
//                       .map((e) => LatLng(e.latitude, e.longitude))
//                       .toList(),
//                 ),
//             },
//             onLongPress: _addMarker,
//           ),
//           if (_info != null)
//             Positioned(
//               top: 20.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 6.0,
//                   horizontal: 12.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.yellowAccent,
//                   borderRadius: BorderRadius.circular(20.0),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0, 2),
//                       blurRadius: 6.0,
//                     )
//                   ],
//                 ),
//                 child: Text(
//                   '${_info.totalDistance}, ${_info.totalDuration}',
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () => _googleMapController.animateCamera(
//           _info != null
//               ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
//               : CameraUpdate.newCameraPosition(initPos),
//         ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }

//   void _addMarker(LatLng pos) async {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       // Origin is not set OR Origin/Destination are both set
//       // Set origin
//       setState(() {
//         _origin = Marker(
//           markerId: MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         // Reset destination
//         _destination = null;

//         // Reset info
//         _info = null;
//       });
//     } else {
//       // Origin is already set
//       // Set destination
//       setState(() {
//         _destination = Marker(
//           markerId: MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });

//       // Get directions
//       final directions = await DirectionsRepository()
//           .getDirections(origin: _origin.position, destination: pos);
//       setState(() => _info = directions);
//     }
//   }
// }
