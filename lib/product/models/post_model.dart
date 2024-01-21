// {
//     "userId": 1,
//     "id": 1,
//     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//   }

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Posts extends INetworkModel<Posts> with EquatableMixin {
  Posts({this.body, this.id, this.title, this.userId});
  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  @override
  List<Object?> get props => [userId, id, title, body];

  @override
  Map<String, dynamic> toJson() => _$PostsToJson(this);

  @override
  Posts fromJson(Map<String, dynamic> json) {
    return _$PostsFromJson(json);
  }

  Posts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Posts(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
