import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MissionMap extends StatefulWidget {
  @override
  _MissionMapState createState() => _MissionMapState();
}

class _MissionMapState extends State<MissionMap> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;

  final LatLng _center = const LatLng(25.0339206, 121.5636985);
  String _mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller.setMapStyle(_mapStyle);
      },
      mapType: MapType.normal,
      mapToolbarEnabled: false,
      compassEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 16.0,
        tilt: 90,
      ),
    );
  }
}
