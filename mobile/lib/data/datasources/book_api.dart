import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../models/book.dart';
import '../models/book_status.dart';

class BookApi {
  final Dio _dio;

  BookApi(this._dio);

  Future<List<Book>> searchBooks(String keyword) async {
    try {
      final response = await _dio.get(ApiConstants.searchBooks(keyword));
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Book.fromJson(json)).toList();
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
        return Book.fromJson(response.data);
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
        return data.map((json) => Book.fromJson(json)).toList();
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