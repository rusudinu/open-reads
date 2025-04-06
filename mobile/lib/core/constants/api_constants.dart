import 'app_config.dart';

class ApiConstants {
  // Base URLs
  static String get baseUrl => AppConfig.apiBaseUrl;
  
  // Endpoints
  static const String bookEndpoint = '/book';
  static const String searchEndpoint = '/search';
  static const String profileEndpoint = '/profile';
  static const String ratingEndpoint = '/rating';
  static const String feedEndpoint = '/feed';
  
  // Full API Routes
  static String searchBooks(String keyword) => '$baseUrl$bookEndpoint$searchEndpoint/$keyword';
  static String getBook(int id) => '$baseUrl$bookEndpoint/$id';
  static String getRecommendedBooks() => '$baseUrl$bookEndpoint/recommended';
  static String getBookStatus(int bookId) => '$baseUrl$bookEndpoint/status/$bookId';
  static String markBookAsReading(int bookId) => '$baseUrl$bookEndpoint/mark-as-reading/$bookId';
  static String markBookAsRead(int bookId) => '$baseUrl$bookEndpoint/mark-as-read/$bookId';
  static String markBookAsWantToRead(int bookId) => '$baseUrl$bookEndpoint/mark-as-want-to-read/$bookId';
  
  // Rating routes
  static String getBookRating(int bookId) => '$baseUrl$ratingEndpoint/$bookId';
  static String getMyBookRating(int bookId) => '$baseUrl$ratingEndpoint/me/$bookId';
  static String setBookRating(int bookId, int rating) => '$baseUrl$ratingEndpoint/$bookId/$rating';
  
  // Profile routes
  static String getMyProfile() => '$baseUrl$profileEndpoint/me';
  static String getUserProfile(String username) => '$baseUrl$profileEndpoint/$username';
  static String getFriends() => '$baseUrl$profileEndpoint/friends';
  
  // Feed routes
  static String getFeed() => '$baseUrl$feedEndpoint';
} 