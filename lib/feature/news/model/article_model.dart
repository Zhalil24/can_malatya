import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'article_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  anyMap: true,
  checked: true,
  createToJson: true,
  createPerFieldToJson: true,
  includeIfNull: true,
)
class Article extends INetworkModel<Article> with EquatableMixin {
  Article({this.description, this.publishedAt, this.title, this.url, this.author, this.content, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
  final DateTime? publishedAt;

  @override
  Article fromJson(Map<String, dynamic> json) {
    return _$ArticleFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ArticleToJson(this);
  }

  @override
  List<Object?> get props => [author, title, url, publishedAt, content, description, content];

  Article copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? content,
    DateTime? publishedAt,
  }) {
    return Article(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}
