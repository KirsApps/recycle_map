import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../repository/map_repository.dart';
import 'bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository mapRepository;

  MapBloc({@required this.mapRepository})
      : assert(mapRepository != null),
        super(MapInitial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is MapStarted) {
      yield* mapMapStartedToState(event);
    } else if (event is MapRecycleCentersDataDownloaded) {
      yield* mapMapRecycleCentersDataDownloadedToState(event);
    } else if (event is MapCitiesDataDownloaded) {
      yield* mapMapCitiesDataDownloadedToState(event);
    }
  }

  Stream<MapState> mapMapStartedToState(_) async* {
    try {
      List<CountryMarker> countriesList = await mapRepository.loadCountriesData();
      yield MapDataDownloadSuccess(MapData(countries: countriesList));
    } catch (_) {
      yield MapDataDownloadFailure();
    }
  }

  Stream<MapState> mapMapRecycleCentersDataDownloadedToState(event) async* {
    try {
      if ((state as MapDataDownloadSuccess).mapData.selectedCountry == null) throw Exception("country not selected");
      List<CityMarker> citiesList = (state as MapDataDownloadSuccess).mapData.selectedCountry.cities.toList();
      int cityIndex = citiesList.indexWhere((city) => city.postCode == event.postCode);
      if (citiesList[cityIndex].recycleCenters?.isNotEmpty ?? false) {
        citiesList[cityIndex] = citiesList[cityIndex].copyWith(isTapped: true);
      } else {
        List<RecycleCenterMarker> recycleCentersList =
            await mapRepository.loadCityRecycleCentersData(citiesList[cityIndex].recycleCentersDatabasePath);
        citiesList[cityIndex] = citiesList[cityIndex].copyWith(isTapped: true, recycleCenters: recycleCentersList);
      }
      if ((state as MapDataDownloadSuccess).mapData.selectedCity != null) {
        int lastCityIndex = citiesList
            .indexWhere((city) => city.postCode == (state as MapDataDownloadSuccess).mapData.selectedCity.postCode);
        citiesList[lastCityIndex] = citiesList[lastCityIndex].copyWith(isTapped: false);
      }
      yield MapDataDownloadSuccess((state as MapDataDownloadSuccess).mapData.copyWith(
          selectedCity: citiesList[cityIndex],
          selectedCountry: (state as MapDataDownloadSuccess).mapData.selectedCountry.copyWith(
                cities: citiesList,
              )));
    } catch (_) {
      yield MapDataDownloadFailure();
    }
  }

  Stream<MapState> mapMapCitiesDataDownloadedToState(event) async* {
    try {
      List<CountryMarker> countriesList = (state as MapDataDownloadSuccess).mapData.countries.toList();
      int countryIndex = countriesList.indexWhere((country) => country.countryCode == event.countryCode);
      if (countriesList[countryIndex].cities?.isNotEmpty ?? false) {
        countriesList[countryIndex] = countriesList[countryIndex].copyWith(isTapped: true);
      } else {
        List<CityMarker> citiesList =
            await mapRepository.loadCitiesData(countriesList[countryIndex].citiesDatabasePath);
        countriesList[countryIndex] = countriesList[countryIndex].copyWith(cities: citiesList, isTapped: true);
      }
      if ((state as MapDataDownloadSuccess).mapData.selectedCountry != null) {
        int lastCountryIndex = countriesList.indexWhere(
            (country) => country.countryCode == (state as MapDataDownloadSuccess).mapData.selectedCountry.countryCode);
        countriesList[lastCountryIndex] = countriesList[lastCountryIndex].copyWith(isTapped: false);
      }
      yield MapDataDownloadSuccess((state as MapDataDownloadSuccess)
          .mapData
          .copyWith(countries: countriesList, selectedCountry: countriesList[countryIndex]));
    } catch (_) {
      yield MapDataDownloadFailure();
    }
  }
}
