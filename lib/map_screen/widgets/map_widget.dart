import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

import '../map_bloc/bloc.dart';
import '../models/models.dart';
import '../widgets/recycle_center.dart';

class MapWidget extends StatefulWidget {
  final List<Marker> markers;
  MapWidget({this.markers});
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(55.5, 38.09),
        zoom: 4.0,
        plugins: [
          MarkerClusterPlugin(),
        ],
      ),
      layers: [
        TileLayerOptions(
            maxZoom: 20,
            maxNativeZoom: 20,
            keepBuffer: 6,
            backgroundColor: Colors.white,
            urlTemplate: "https://tile-{s}.openstreetmap.fr/hot/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerClusterLayerOptions(
          showPolygon: false,
          centerMarkerOnClick: false,
          onMarkerTap: (marker) {
            if (marker is CountryMarker) {
              BlocProvider.of<MapBloc>(context).add(MapCitiesDataDownloaded(marker.countryCode));
            } else if (marker is CityMarker) {
              BlocProvider.of<MapBloc>(context).add(MapRecycleCentersDataDownloaded(
                marker.postCode,
              ));
            } else if (marker is RecycleCenterMarker) {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return RecycleCenterWidget(marker);
              }));
            }
          },
          maxClusterRadius: 120,
          size: const Size(40, 40),
          markers: widget.markers,
          builder: (context, markers) {
            return const Image(
              image: const AssetImage("assets/cluster.png"),
            );
          },
        ),
      ],
    );
  }
}
