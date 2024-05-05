import 'dart:convert';
import 'Inews_service.dart';
import '../../../product/services/manager/product_servive_path.dart';
import '../../../product/services/manager/service_path.dart';

import '../model/article_model.dart';
import 'package:http/http.dart' as http;

// class NewsService extends INewsService {
//   NewsService(super.manager, super.scaffoldKey);

//   @override
//   Future<List<Article>?> fetchNewsList() async {
//     final response = await manager.send<News, List<Article>>(
//       ServicePath.news.rawValue,
//       parseModel: News(),
//       method: RequestType.GET,
//     );

//     return response.data;
//   }
// }

class News1 extends INewsService {
  @override
  Future<List<Article>?> getNews() async {
    String url = "${ProductServicePath.news.rawValue}${ServicePath.news.rawValue}";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["title"] != null && element["url"] != null) {
          Article articleModel = Article.fromJson(element);
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}
