import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:recycle_map/articles_screen/widgets/bottom_loader.dart';
import 'package:recycle_map/localizations.dart';

import 'bloc/bloc.dart';
import 'repository/article_data_provider.dart';
import 'repository/article_repository.dart';
import 'widgets/article_card.dart';
import 'widgets/article_empty.dart';
import 'widgets/article_error.dart';
import 'widgets/article_loading.dart';

class ArticlesScreen extends StatefulWidget {
  final String localeName;
  ArticlesScreen({@required this.localeName}) : assert(localeName != null);
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ArticleBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _articleBloc = ArticleBloc(
        articleRepository: ArticleRepository(articleDataProvider: ArticleDataProvider(httpClient: http.Client())),
        localeName: widget.localeName)
      ..add(ArticleFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).articlesScreenTitle),
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          bloc: _articleBloc,
          builder: (context, state) {
            if (state is ArticleInitial) {
              return ArticleLoading();
            } else if (state is ArticleSuccess) {
              if (state.articles.isEmpty) {
                return ArticleEmpty();
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.articles.length
                      ? BottomLoader()
                      : ArticleCard(
                          article: state.articles[index],
                        );
                },
                itemCount: state.hasReachedMax ? state.articles.length : state.articles.length + 1,
                controller: _scrollController,
              );
            }
            return ArticleError();
          },
        ));
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _articleBloc?.close();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _articleBloc.add(ArticleFetched());
    }
  }
}
