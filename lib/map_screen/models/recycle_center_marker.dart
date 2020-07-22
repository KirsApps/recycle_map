import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'timetable.dart';

class RecycleCenterMarker extends Marker {
  final LatLng point;
  final double width;
  final double height;
  final Anchor anchor;
  final String name;
  final String description;
  final String address;
  final TimeTable timeTable;
  final List<String> wasteTypes;
  final String phone;
  final String email;
  final String site;

  RecycleCenterMarker(
      {this.point,
      this.width = 30.0,
      this.height = 30.0,
      AnchorPos anchorPos,
      this.address,
      this.description,
      this.name,
      this.timeTable,
      this.wasteTypes,
      this.email,
      this.site,
      this.phone})
      : anchor = Anchor.forPos(anchorPos, width, height);

  WidgetBuilder get builder => (context) => const Image(
        image: const AssetImage("assets/recycle.png"),
      );

  bool get contactsInformationExists => phone != null || site != null || email != null;
}
