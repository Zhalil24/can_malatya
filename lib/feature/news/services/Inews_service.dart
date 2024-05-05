import '../model/article_model.dart';

abstract class INewsService {
  // final INetworkManager manager;
  // final GlobalKey<ScaffoldState> scaffoldKey;

  // INewsService(this.manager, this.scaffoldKey);
  // Future<List<Article>?> fetchNewsList();
  List<Article> news = [];
  Future<List<Article>?> getNews();
}
