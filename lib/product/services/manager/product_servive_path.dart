enum ProductServicePath { photos, posts }

extension NetworkRoutesString on ProductServicePath {
  String get rawValue {
    switch (this) {
      case ProductServicePath.photos:
        return "photos";
      case ProductServicePath.posts:
        return "posts";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
