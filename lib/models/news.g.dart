// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    json['CmsID'] as String,
    json['CategoryName'] as String,
    json['Title'] as String,
    json['CreatedDate'] as String,
    json['UpdatedDate'] as String,
    json['Slug'] as String,
    json['Attachment'] as String,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'CmsID': instance.cmsId,
      'CategoryName': instance.categoryName,
      'Title': instance.title,
      'CreatedDate': instance.createdDate,
      'UpdatedDate': instance.updatedDate,
      'Slug': instance.slug,
      'Attachment': instance.attachment,
    };
