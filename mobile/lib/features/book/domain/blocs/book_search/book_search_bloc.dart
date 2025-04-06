import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/book/domain/repositories/book_repository.dart';
import 'book_search_event.dart';
import 'book_search_state.dart';

class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  final BookRepository bookRepository;

  BookSearchBloc({required this.bookRepository}) : super(BookSearchInitial()) {
    on<SearchBooks>(_onSearchBooks);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchBooks(
    SearchBooks event,
    Emitter<BookSearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(BookSearchInitial());
      return;
    }

    emit(BookSearchLoading());
    try {
      final books = await bookRepository.searchBooks(event.query);
      emit(BookSearchLoaded(books));
    } catch (e) {
      emit(BookSearchError(e.toString()));
    }
  }

  void _onClearSearch(
    ClearSearch event,
    Emitter<BookSearchState> emit,
  ) {
    emit(BookSearchInitial());
  }
} 
