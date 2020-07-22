import 'package:flutter_map/flutter_map.dart';

import 'city_marker.dart';
import 'country_marker.dart';

class MapData {
  final CountryMarker selectedCountry;
  final CityMarker selectedCity;
  final List<CountryMarker> countries;
  MapData({this.selectedCountry, this.selectedCity, this.countries});

  List<Marker> get mapMarkers {
    List<Marker> markers;
    if (selectedCountry?.isTapped ?? false) {
      if (selectedCity?.isTapped ?? false) {
        markers = [
          ...countries.where((element) => element.countryCode != selectedCountry.countryCode),
          ...selectedCountry.cities.where((element) => element.postCode != selectedCity.postCode),
          ...selectedCity.recycleCenters
        ];
      } else {
        markers = [
          ...countries.where((element) => element.countryCode != selectedCountry.countryCode),
          ...selectedCountry.cities
        ];
      }
    } else {
      markers = [...countries];
    }

    return markers;
  }

  MapData copyWith({
    CountryMarker selectedCountry,
    CityMarker selectedCity,
    List<CountryMarker> countries,
  }) {
    return MapData(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedCity: selectedCity ?? this.selectedCity,
      countries: countries ?? this.countries,
    );
  }
}
