import "dart:async";
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MapDataProvider {
  static const countriesDatabaseUrl = 'https://github.com/KirsApps/recycle_map/raw/master/data/countries.db';
  final http.Client httpClient;

  MapDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Uint8List> _downloadDatabaseData(String databaseUrl) async {
    final response = await httpClient.get(databaseUrl);

    if (response.statusCode != 200) {
      throw Exception('error getting database data');
    }

    return response.bodyBytes;
  }

  Future<List<Map<String, dynamic>>> _loadLocalDatabaseData(String databaseName, String tableName) async {
    final Database database = await openDatabase(databaseName, readOnly: true);
    List<Map<String, dynamic>> data = await database.rawQuery('SELECT * FROM $tableName');
    await database.close();
    return data;
  }

  Future<List<Map<String, dynamic>>> loadDatabaseData(String databaseUrl, String tableName) async {
    String databaseName = databaseUrl.split("/").last;
    bool exists = await databaseExists(databaseName);
    if (!exists) {
      Uint8List databaseData = await _downloadDatabaseData(databaseUrl);
      String databasesPath = await getDatabasesPath();
      await File(join(databasesPath, databaseName)).writeAsBytes(databaseData, flush: true);
    }
    return await _loadLocalDatabaseData(databaseName, tableName);
  }
}
