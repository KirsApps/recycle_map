import "dart:async";

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ArticleDataProvider {
  final http.Client httpClient;

  ArticleDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<String> downloadArticleData(String localeName, int startIndex, int limit) async {
    final response =
        await httpClient.get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');

    if (response.statusCode != 200) {
      throw Exception('error getting articles data');
    }

    return response.body;
  }
}
