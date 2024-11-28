import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final databaseRef = FirebaseDatabase.instance.ref("locations");
  Map<String, LatLng> locations = {};

  @override
  void initState() {
    super.initState();
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        locations = data.map((key, value) {
          final lat = value['latitude'] as double;
          final lng = value['longitude'] as double;
          return MapEntry(value['name'], LatLng(lat, lng));
        });
      });
    });
  }

  void _navigateTo(String name) {
    final destination = locations[name];
    if (destination != null) {
      // Aquí puedes integrar un API de enrutamiento
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Navegando a $name")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buscar Amiguito")),
      body: ListView(
        children: locations.keys.map((name) {
          return ListTile(
            title: Text(name),
            onTap: () => _navigateTo(name),
          );
        }).toList(),
      ),
    );
  }
}
