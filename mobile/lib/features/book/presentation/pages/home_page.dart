import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile/features/book/domain/blocs/book_search/book_search_bloc.dart';
import 'package:mobile/features/book/domain/blocs/book_search/book_search_event.dart';
import 'package:mobile/features/book/domain/blocs/book_search/book_search_state.dart';
import 'package:mobile/features/book/presentation/widgets/book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Reads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Navigate to profile
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<BookSearchBloc>().add(SearchBooks(query));
                } else {
                  context.read<BookSearchBloc>().add(ClearSearch());
                }
              },
            ),
          ),
          // Book list
          Expanded(
            child: BlocBuilder<BookSearchBloc, BookSearchState>(
              builder: (context, state) {
                if (state is BookSearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BookSearchLoaded) {
                  if (state.books.isEmpty) {
                    return const Center(
                      child: Text('No books found'),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return BookCard(
                        book: book,
                        onTap: () {
                          // TODO: Navigate to book details
                        },
                      );
                    },
                  );
                } else if (state is BookSearchError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const Center(
                  child: Text('Search for books to get started'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 
