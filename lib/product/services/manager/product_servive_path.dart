enum ProductServicePath { photos, posts, login, news, weather }

extension NetworkRoutesString on ProductServicePath {
  String get rawValue {
    switch (this) {
      case ProductServicePath.photos:
        return "https://jsonplaceholder.typicode.com/";
      case ProductServicePath.posts:
        return "https://jsonplaceholder.typicode.com/";
      case ProductServicePath.login:
        return "https://reqres.in/api/";
      case ProductServicePath.news:
        return "https://newsapi.org/v2/";
      case ProductServicePath.weather:
        return "https://api.openweathermap.org/data/2.5/";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
