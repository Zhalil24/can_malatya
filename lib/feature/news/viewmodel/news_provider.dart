import '../services/Inews_service.dart';

import '../model/article_model.dart';
import '../services/new_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsProvider extends StateNotifier<NewsState> {
  NewsProvider() : super(const NewsState());

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // late INewsService newsService;
  late INewsService newsService;

  void changeLoading() {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(isLoading: !state.isLoading!);
    });
  }

  void init() {
    // newsService = NewsService(ProductNetworkManager.base(ProductServicePath.news), scaffoldKey);
    newsService = News1();
  }

  Future<void> getListAll() async {
    // changeLoading();
    // var fetchedNews = await newsService.fetchNewsList();
    // state = state.copyWith(article: fetchedNews != null ? fetchedNews : []);
    // changeLoading();
    changeLoading();
    await newsService.getNews();
    state = state.copyWith(article: newsService.news);
    changeLoading();
  }
}

class NewsState extends Equatable {
  final bool? isLoading;
  final List<Article>? article;

  const NewsState({
    this.isLoading = false,
    this.article,
  });

  NewsState copyWith({
    bool? isLoading,
    List<Article>? article,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      article: article ?? this.article,
    );
  }

  @override
  List<Object?> get props => [isLoading, article];
}
