// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map json) => $checkedCreate(
      'Article',
      json,
      ($checkedConvert) {
        final val = Article(
          description: $checkedConvert('description', (v) => v as String?),
          publishedAt: $checkedConvert('publishedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          title: $checkedConvert('title', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
          author: $checkedConvert('author', (v) => v as String?),
          content: $checkedConvert('content', (v) => v as String?),
          urlToImage: $checkedConvert('urlToImage', (v) => v as String?),
        );
        return val;
      },
    );

// ignore: unused_element
abstract class _$ArticlePerFieldToJson {
  // ignore: unused_element
  static Object? author(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String? instance) => instance;
  // ignore: unused_element
  static Object? description(String? instance) => instance;
  // ignore: unused_element
  static Object? url(String? instance) => instance;
  // ignore: unused_element
  static Object? urlToImage(String? instance) => instance;
  // ignore: unused_element
  static Object? content(String? instance) => instance;
  // ignore: unused_element
  static Object? publishedAt(DateTime? instance) => instance?.toIso8601String();
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };
