import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localizations.dart';
import '../widgets/screen_drawer.dart';
import 'map_bloc/bloc.dart';
import 'widgets/map_error.dart';
import 'widgets/map_loading.dart';
import 'widgets/map_widget.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).mapScreenTitle),
        ),
        drawer: const ScreenDrawer(),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is MapInitial) {
              return MapLoading();
            } else if (state is MapDataDownloadSuccess) {
              return MapWidget(markers: state.mapData.mapMarkers);
            } else
              return MapError();
          },
        ));
  }
}
