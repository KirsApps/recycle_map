import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong/latlong.dart';

import '../models/models.dart';
import 'map_data_provider.dart';

class MapRepository {
  final MapDataProvider mapDataProvider;

  MapRepository({@required this.mapDataProvider}) : assert(mapDataProvider != null);

  Future<List<CountryMarker>> loadCountriesData() async {
    List<Map<String, dynamic>> countriesData =
        await mapDataProvider.loadDatabaseData(MapDataProvider.countriesDatabaseUrl, "countries");
    List<CountryMarker> countriesList = await compute(_parseCountries, countriesData);
    return countriesList;
  }

  Future<List<CityMarker>> loadCitiesData(String citiesDatabaseUrl) async {
    List<Map<String, dynamic>> citiesData = await mapDataProvider.loadDatabaseData(citiesDatabaseUrl, "cities");
    List<CityMarker> cities = await compute(_parseCities, citiesData);
    return cities;
  }

  Future<List<RecycleCenterMarker>> loadCityRecycleCentersData(String recycleCentersDatabaseUrl) async {
    List<Map<String, dynamic>> recycleCentersData =
        await mapDataProvider.loadDatabaseData(recycleCentersDatabaseUrl, "recycleCenters");

    List<RecycleCenterMarker> recycleCenters = await compute(_parseRecycleCenters, recycleCentersData);

    return recycleCenters;
  }

  static List<CountryMarker> _parseCountries(List<Map<String, dynamic>> countriesData) {
    List<CountryMarker> countries = countriesData
        .map((country) => CountryMarker(
            point: LatLng(country["lat"], country["lng"]),
            isTapped: false,
            countryCode: country["countryCode"],
            cities: [],
            citiesDatabasePath: country["citiesDatabasePath"]))
        .toList();
    return countries;
  }

  static List<CityMarker> _parseCities(List<Map<String, dynamic>> citiesData) {
    List<CityMarker> cities = citiesData
        .map((city) => CityMarker(
            point: LatLng(
              city["lat"],
              city["lng"],
            ),
            isTapped: false,
            recycleCenters: [],
            recycleCentersDatabasePath: city["recycleCentersDatabasePath"],
            postCode: city["postCode"]))
        .toList();
    return cities;
  }

  static List<RecycleCenterMarker> _parseRecycleCenters(List<Map<String, dynamic>> recycleCentersData) {
    List<RecycleCenterMarker> recycleCenters = recycleCentersData
        .map((center) => RecycleCenterMarker(
            point: LatLng(center["lat"], center["lng"]),
            name: center["name"],
            description: center["description"],
            address: center['address'],
            timeTable: center['timeTable'] != null ? TimeTable.fromMap(json.decode(center['timeTable'])) : null,
            wasteTypes: List<String>.from(json.decode(center['wasteTypes'])),
            phone: center['phone'],
            site: center['site'],
            email: center['email']))
        .toList();
    return recycleCenters;
  }
}
