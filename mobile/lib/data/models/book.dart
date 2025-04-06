import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
  final int id;
  final String title;
  final String author;
  final String description;
  final String coverUrl;
  final List<String> categories;
  final double averageRating;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.coverUrl,
    required this.categories,
    this.averageRating = 0.0,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [id, title, author, description, coverUrl, categories, averageRating];
} 