import '../datasources/book_api.dart';
import '../models/book.dart';
import '../models/book_status.dart';

class BookRepository {
  final BookApi _bookApi;

  BookRepository(this._bookApi);

  Future<List<Book>> searchBooks(String keyword) async {
    return await _bookApi.searchBooks(keyword);
  }

  Future<Book> getBook(int id) async {
    return await _bookApi.getBook(id);
  }

  Future<List<Book>> getRecommendedBooks() async {
    return await _bookApi.getRecommendedBooks();
  }

  Future<BookStatus> getBookStatus(int bookId) async {
    return await _bookApi.getBookStatus(bookId);
  }
} 