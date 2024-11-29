import 'package:flutter/material.dart';
import 'animated_markers_map.dart';

class MainAnimatedMarkersMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: AnimatedMarkersMap(),
    ); // Theme
  }
}
