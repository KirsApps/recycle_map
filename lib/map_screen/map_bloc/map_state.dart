import 'package:equatable/equatable.dart';

import '../models/models.dart';

abstract class MapState extends Equatable {
  const MapState();
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapDataDownloadSuccess extends MapState {
  final MapData mapData;

  MapDataDownloadSuccess(this.mapData);

  @override
  List<Object> get props => [mapData];
}

class MapDataDownloadFailure extends MapState {}
