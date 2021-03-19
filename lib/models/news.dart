import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class News {
  @JsonKey(name: "CmsID")
  final String cmsId;
  @JsonKey(name: "CategoryName")
  final String categoryName;
  @JsonKey(name: "Title")
  final String title;
  @JsonKey(name: "Content")
  final String content;
  @JsonKey(name: "CreatedDate")
  final String createdDate;
  @JsonKey(name: "UpdatedDate")
  final String updatedDate;
  @JsonKey(name: "Slug")
  final String slug;
  @JsonKey(name: "Attachment")
  final String attachment;

  const News(this.cmsId, this.categoryName, this.title, this.content,
      this.createdDate, this.updatedDate, this.slug, this.attachment);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
