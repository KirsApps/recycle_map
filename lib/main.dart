import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'localizations.dart';
import 'map_screen/map_bloc/bloc.dart';
import 'map_screen/map_screen.dart';
import 'map_screen/repository/map_data_provider.dart';
import 'map_screen/repository/map_repository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 360, height: 640);
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: const Color(0xFF324A5E)),
          primaryColor: const Color(0xFF324A5E),
          accentColor: const Color(0xFF928048)),
      supportedLocales: const [Locale('en', ''), Locale('ru', '')],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: BlocProvider(
          create: (context) =>
              MapBloc(mapRepository: MapRepository(mapDataProvider: MapDataProvider(httpClient: http.Client())))
                ..add(MapStarted()),
          child: MapScreen()),
    );
  }
}
