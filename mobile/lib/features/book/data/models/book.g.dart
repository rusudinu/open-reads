// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  author: json['author'] as String,
  description: json['description'] as String,
  coverUrl: json['coverUrl'] as String,
  categories:
      (json['categories'] as List<dynamic>).map((e) => e as String).toList(),
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'description': instance.description,
  'coverUrl': instance.coverUrl,
  'categories': instance.categories,
  'averageRating': instance.averageRating,
};
