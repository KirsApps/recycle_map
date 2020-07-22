import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
  @override
  List<Object> get props => [];
}

class MapStarted extends MapEvent {}

class MapRecycleCentersDataDownloaded extends MapEvent {
  final int postCode;

  MapRecycleCentersDataDownloaded(this.postCode);
  @override
  List<Object> get props => [postCode];
}

class MapCitiesDataDownloaded extends MapEvent {
  final String countryCode;

  MapCitiesDataDownloaded(this.countryCode);
  @override
  List<Object> get props => [countryCode];
}
