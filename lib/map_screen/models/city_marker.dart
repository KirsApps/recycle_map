import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'recycle_center_marker.dart';

class CityMarker extends Marker {
  final LatLng point;
  final double width;
  final double height;
  final Anchor anchor;
  final bool isTapped;
  final List<RecycleCenterMarker> recycleCenters;
  final int postCode;
  final String recycleCentersDatabasePath;

  CityMarker({
    this.point,
    this.width = 30.0,
    this.height = 30.0,
    AnchorPos anchorPos,
    this.isTapped,
    this.recycleCenters,
    this.postCode,
    this.recycleCentersDatabasePath,
  }) : anchor = Anchor.forPos(anchorPos, width, height);

  WidgetBuilder get builder => (context) => getCityMapIcon(postCode);

  CityMarker copyWith({
    LatLng point,
    double width,
    double height,
    bool isTapped,
    List<RecycleCenterMarker> recycleCenters,
    int postCode,
    String recycleCentersDatabasePath,
  }) {
    return CityMarker(
      point: point ?? this.point,
      width: width ?? this.width,
      height: height ?? this.height,
      isTapped: isTapped ?? this.isTapped,
      recycleCenters: recycleCenters ?? this.recycleCenters,
      postCode: postCode ?? this.postCode,
      recycleCentersDatabasePath: recycleCentersDatabasePath ?? this.recycleCentersDatabasePath,
    );
  }

  Widget getCityMapIcon(int postCode) {
    switch (postCode) {
      case 603000:
        {
          return const Image(
            image: const AssetImage("assets/603000.png"),
          );
        }
        break;
      case 101000:
        {
          return const Image(
            image: const AssetImage("assets/101000.png"),
          );
        }
        break;
      default:
        {
          return const Image(
            image: const AssetImage("assets/defaultCity.png"),
          );
        }
        break;
    }
  }
}
