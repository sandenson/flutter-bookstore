import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final int? height;
  final int? width;

  MapWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kIFALCampusArapiraca = CameraPosition(
    target: LatLng(-9.7451044, -36.6314583),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          SizedBox(
            height: (widget.height != null
                ? widget.height!.toDouble()
                : MediaQuery.of(context).size.height),
            width: (widget.width != null
                ? widget.width!.toDouble()
                : MediaQuery.of(context).size.width),
            child: GoogleMap(
              mapType: MapType.hybrid,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              tiltGesturesEnabled: false,
              initialCameraPosition: _kIFALCampusArapiraca,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
