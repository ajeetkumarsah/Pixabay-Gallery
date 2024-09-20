import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final int? id;
  @JsonKey(name: 'pageURL')
  final String? pageUrl;
  final String? type;
  final String? tags;
  @JsonKey(name: 'previewURL')
  final String? previewUrl;
  @JsonKey(name: 'previewWidth')
  final int? previewWidth;
  @JsonKey(name: 'previewHeight')
  final int? previewHeight;
  @JsonKey(name: 'webformatURL')
  final String? webformatUrl;
  @JsonKey(name: 'webformatWidth')
  final int? webformatWidth;
  @JsonKey(name: 'webformatHeight')
  final int? webformatHeight;
  @JsonKey(name: 'largeImageURL')
  final String? largeImageUrl;
  @JsonKey(name: 'fullHDURL')
  final String? fullHdUrl;
  @JsonKey(name: 'imageURL')
  final String? imageUrl;
  @JsonKey(name: 'imageWidth')
  final int? imageWidth;
  @JsonKey(name: 'imageHeight')
  final int? imageHeight;
  @JsonKey(name: 'imageSize')
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? user;
  @JsonKey(name: 'userImageURL')
  final String? userImageUrl;

  ImageModel({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.fullHdUrl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  // From JSON
  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
