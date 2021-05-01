import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scanner/models/scan.dart';
import 'package:scanner/services/scan_list.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType maptipe = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    final CameraPosition posInit = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
    );
    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('geo'),
        position: scan.getLatLng(),
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_disabled),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(), zoom: 17.5, tilt: 50)));
            },
          )
        ],
      ),
      body: GoogleMap(
        markers: markers,
        mapType: maptipe,
        initialCameraPosition: posInit,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (maptipe == MapType.normal)
            maptipe = MapType.satellite;
          else
            maptipe = MapType.normal;
          setState(() {});
        },
        child: Icon(Icons.layers),
      ),
    );
  }
}
