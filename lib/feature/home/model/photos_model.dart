import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class Photos extends INetworkModel<Photos> with EquatableMixin {
  Photos({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

  @override
  Map<String, dynamic> toJson() => _$PhotosToJson(this);

  @override
  Photos fromJson(Map<String, dynamic> json) {
    return _$PhotosFromJson(json);
  }

  Photos copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Photos(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}

// {
//     "albumId": 1,
//     "id": 1,
//     "title": "accusamus beatae ad facilis cum similique qui sunt",
//     "url": "https://via.placeholder.com/600/92c952",
//     "thumbnailUrl": "https://via.placeholder.com/150/92c952"
//   }