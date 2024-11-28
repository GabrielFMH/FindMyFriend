import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng? selectedPosition;
  final databaseRef = FirebaseDatabase.instance.ref("locations");

  void _onMapTapped(LatLng position) {
    setState(() {
      selectedPosition = position;
    });
  }

  void _saveLocation(String name) {
    if (selectedPosition != null) {
      databaseRef.push().set({
        "name": name,
        "latitude": selectedPosition!.latitude,
        "longitude": selectedPosition!.longitude,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ubicación guardada como $name")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seleccionar Marcador")),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            onTap: _onMapTapped,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12,
            ),
            markers: selectedPosition != null
                ? {
                    Marker(
                      markerId: const MarkerId("selected"),
                      position: selectedPosition!,
                    ),
                  }
                : {},
          ),
          if (selectedPosition != null)
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nombre del marcador",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                onSubmitted: _saveLocation,
              ),
            ),
        ],
      ),
    );
  }
}
