import 'package:dio/dio.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:mobile/features/book/data/models/book.dart';
import 'package:mobile/features/book/data/models/book_status.dart';
import 'dart:convert';

class BookApi {
  final Dio _dio;

  BookApi(this._dio);

  Future<List<Book>> searchBooks(String keyword) async {
    try {
      if (keyword.isEmpty) {
        return [];
      }
      
      final response = await _dio.get(ApiConstants.searchBooks(keyword));
      print("Response: ${response.data} ${response.statusCode}");
      if (response.statusCode == 200) {
        if (response.data is String) {
          try {
            final dynamic decoded = json.decode(response.data as String);
            if (decoded is List) {
              return decoded.map((json) => Book.fromJson(json)).toList();
            } else {
              return [];
            }
          } catch (e) {
            return [];
          }
        } else if (response.data is List) {
          final List<dynamic> data = response.data;
          final List<Book> books = [];
          for (var item in data) {
            try {
              books.add(Book.fromJson(item));
            } catch (e) {
              print('Error parsing book: $e');
              // Skip this book if it can't be parsed
            }
          }
          return books;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to search books');
      }
    } catch (e) {
      throw Exception('Failed to search books: $e');
    }
  }

  Future<Book> getBook(int id) async {
    try {
      final response = await _dio.get(ApiConstants.getBook(id));
      if (response.statusCode == 200) {
        try {
          return Book.fromJson(response.data);
        } catch (e) {
          print('Error parsing book details: $e');
          throw Exception('Failed to parse book data: $e');
        }
      } else {
        throw Exception('Failed to get book');
      }
    } catch (e) {
      throw Exception('Failed to get book: $e');
    }
  }

  Future<List<Book>> getRecommendedBooks() async {
    try {
      final response = await _dio.get(ApiConstants.getRecommendedBooks());
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Book> books = [];
        for (var item in data) {
          try {
            books.add(Book.fromJson(item));
          } catch (e) {
            print('Error parsing recommended book: $e');
            // Skip this book if it can't be parsed
          }
        }
        return books;
      } else {
        throw Exception('Failed to get recommended books');
      }
    } catch (e) {
      throw Exception('Failed to get recommended books: $e');
    }
  }

  Future<BookStatus> getBookStatus(int bookId) async {
    try {
      final response = await _dio.get(ApiConstants.getBookStatus(bookId));
      if (response.statusCode == 200) {
        final String statusString = response.data.toString();
        return _parseBookStatus(statusString);
      } else {
        throw Exception('Failed to get book status');
      }
    } catch (e) {
      throw Exception('Failed to get book status: $e');
    }
  }

  BookStatus _parseBookStatus(String status) {
    switch (status.toLowerCase()) {
      case 'wanttoread':
        return BookStatus.wantToRead;
      case 'reading':
        return BookStatus.reading;
      case 'read':
        return BookStatus.read;
      default:
        return BookStatus.none;
    }
  }
} 
