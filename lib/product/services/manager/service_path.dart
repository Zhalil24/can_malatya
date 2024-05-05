enum ServicePath { photos, posts, login, news, weather }

extension NetworkRoutesString on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.photos:
        return "photos";
      case ServicePath.posts:
        return "posts";
      case ServicePath.login:
        return "register";
      case ServicePath.news:
        return "top-headlines?country=tr&apiKey=9548545ef7b14f749e99fb6dbeb8ebe5";
      case ServicePath.weather:
        return "weather?lat=38.3557&lon=38.3095&appid=38023509ef45d71767057a94d2101bad";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
