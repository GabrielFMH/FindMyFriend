import 'package:latlong2/latlong.dart'; // Corregir import

class MapMarker {
  const MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
  }); // Corregir formato y cerrar llaves

  final String image;
  final String title;
  final String address;
  final LatLng location; // Corregir `:` por `;`
}

final List<LatLng> locations = [
  LatLng(-12.0080041, -77.0778237),
  LatLng(-12.0430962, -77.0208307),
  LatLng(-12.0480045, -77.0205112),
  LatLng(-12.0654067, -77.0257675),
  LatLng(-12.0238438, -77.0822122),
  LatLng(-12.0211287, -77.0502137),
  LatLng(-12.0622444, -77.0708716),
];

const String path = 'assets/';
final List<MapMarker> mapMarkers = [
  MapMarker(
    image: '${path}logoupt.png',
    title: 'Marcos',
    address: 'Address Marcos 123',
    location: locations[0],
  ),
  MapMarker(
    image: '${path}logounjbg.png',
    title: 'Paavo',
    address: 'Address Paavo 123',
    location: locations[1],
  ),
  MapMarker(
    image: '${path}plazavea.png',
    title: 'Papa Jhons',
    address: 'Address Jhons 123',
    location: locations[2],
  ),
  MapMarker(
    image: '${path}metro.png',
    title: 'Metro',
    address: 'Address Metro 456',
    location: locations[3],
  ),
  MapMarker(
    image: '${path}tottus.png',
    title: 'Tottus',
    address: 'Address Tottus 789',
    location: locations[4],
  ),
  MapMarker(
    image: '${path}saga.png',
    title: 'Saga Falabella',
    address: 'Address Saga 321',
    location: locations[5],
  ),
  MapMarker(
    image: '${path}ripley.png',
    title: 'Ripley',
    address: 'Address Ripley 654',
    location: locations[6],
  ),
];

