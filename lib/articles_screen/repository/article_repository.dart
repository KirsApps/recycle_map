import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';
import 'article_data_provider.dart';

class ArticleRepository {
  final ArticleDataProvider articleDataProvider;
  ArticleRepository({@required this.articleDataProvider}) : assert(articleDataProvider != null);

  Future<List<Article>> fetchArticles(String localeName, int startIndex, int limit) async {
    final String articleResponse = await articleDataProvider.downloadArticleData(localeName, startIndex, limit);
    final List<Map<String, dynamic>> articlesData = List.from(json.decode(articleResponse));
    return articlesData
        .map<Article>((article) =>
            Article(title: article["title"], body: article["body"], description: article["title"], date: "24/07/2020"))
        .toList();
  }
}
