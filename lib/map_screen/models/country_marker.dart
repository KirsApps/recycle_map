import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'city_marker.dart';

class CountryMarker extends Marker {
  final LatLng point;
  final double width;
  final double height;
  final Anchor anchor;
  final bool isTapped;
  final List<CityMarker> cities;
  final String countryCode;
  final String citiesDatabasePath;

  CountryMarker({
    this.point,
    this.width = 30.0,
    this.height = 30.0,
    AnchorPos anchorPos,
    this.isTapped,
    this.cities,
    this.countryCode,
    this.citiesDatabasePath,
  }) : anchor = Anchor.forPos(anchorPos, width, height);

  WidgetBuilder get builder => (context) => getCountryMapIcon(countryCode);

  CountryMarker copyWith({
    LatLng point,
    double width,
    double height,
    bool isTapped,
    List<CityMarker> cities,
    String countryCode,
    String citiesDatabasePath,
  }) {
    return CountryMarker(
      point: point ?? this.point,
      width: width ?? this.width,
      height: height ?? this.height,
      isTapped: isTapped ?? this.isTapped,
      cities: cities ?? this.cities,
      countryCode: countryCode ?? this.countryCode,
      citiesDatabasePath: citiesDatabasePath ?? this.citiesDatabasePath,
    );
  }

  Widget getCountryMapIcon(String countryCode) {
    switch (countryCode) {
      case "RU":
        {
          return const Image(
            image: const AssetImage("assets/RU.png"),
          );
        }
        break;

      default:
        {
          return const Image(
            image: const AssetImage("assets/defaultCountry.png"),
          );
        }
        break;
    }
  }
}
