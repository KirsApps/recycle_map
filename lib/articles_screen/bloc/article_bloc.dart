import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycle_map/articles_screen/repository/article_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc/bloc.dart';
import '../models/models.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  final String localeName;
  ArticleBloc({@required this.articleRepository, @required this.localeName})
      : assert(articleRepository != null, localeName != null),
        super(ArticleInitial());

  @override
  Stream<Transition<ArticleEvent, ArticleState>> transformEvents(
    Stream<ArticleEvent> events,
    TransitionFunction<ArticleEvent, ArticleState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is ArticleFetched && !_hasReachedMax(state)) {
      yield* mapArticleFetchedToState();
    }
  }

  Stream<ArticleState> mapArticleFetchedToState() async* {
    try {
      if (state is ArticleInitial) {
        final List<Article> articles = await articleRepository.fetchArticles(localeName, 0, 10);
        yield ArticleSuccess(articles: articles, hasReachedMax: false);
      }
      if (state is ArticleSuccess) {
        final List<Article> articles =
            await articleRepository.fetchArticles(localeName, (state as ArticleSuccess).articles.length, 10);
        yield articles.isEmpty
            ? (state as ArticleSuccess).copyWith(hasReachedMax: true)
            : ArticleSuccess(
                articles: (state as ArticleSuccess).articles + articles,
                hasReachedMax: false,
              );
      }
    } catch (_) {
      yield ArticleFailure();
    }
  }

  bool _hasReachedMax(ArticleState state) => state is ArticleSuccess && state.hasReachedMax;
}
