import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
  final int id;
  @JsonKey(name: 'name')
  final String? title;
  final String? author;
  final String? description;
  @JsonKey(name: 'coverImageURL')
  final String? coverUrl;
  @JsonKey(name: 'genre')
  final String? genre;
  @JsonKey(defaultValue: 0.0)
  final double averageRating;

  const Book({
    required this.id,
    this.title = '',
    this.author = '',
    this.description = '',
    this.coverUrl = '',
    this.genre = '',
    this.averageRating = 0.0,
  });

  List<String> get categories => genre != null ? [genre!] : [];

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [id, title, author, description, coverUrl, genre, averageRating];
} 