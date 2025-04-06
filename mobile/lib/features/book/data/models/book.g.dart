// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  id: (json['id'] as num).toInt(),
  title: json['name'] as String? ?? '',
  author: json['author'] as String? ?? '',
  description: json['description'] as String? ?? '',
  coverUrl: json['coverImageURL'] as String? ?? '',
  genre: json['genre'] as String? ?? '',
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.title,
  'author': instance.author,
  'description': instance.description,
  'coverImageURL': instance.coverUrl,
  'genre': instance.genre,
  'averageRating': instance.averageRating,
};
