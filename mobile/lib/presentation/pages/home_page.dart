import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/blocs/book_search/book_search_bloc.dart';
import '../../domain/blocs/book_search/book_search_event.dart';
import '../../domain/blocs/book_search/book_search_state.dart';
import '../../data/models/book.dart';
import '../widgets/book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  
  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Open Reads',
                    style: GoogleFonts.merriweather(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.person_outline),
                    onPressed: () {
                      // Navigate to profile page
                    },
                  ),
                ],
              ),
            ),
            
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocus,
                decoration: InputDecoration(
                  hintText: 'Search for books, authors...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            context.read<BookSearchBloc>().add(ClearSearch());
                            _searchFocus.unfocus();
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onChanged: (query) {
                  if (query.trim().isNotEmpty) {
                    context.read<BookSearchBloc>().add(SearchBooks(query));
                  } else {
                    context.read<BookSearchBloc>().add(ClearSearch());
                  }
                },
              ),
            ),
            
            // Content
            Expanded(
              child: BlocBuilder<BookSearchBloc, BookSearchState>(
                builder: (context, state) {
                  if (state is BookSearchInitial) {
                    return _buildInitialContent();
                  } else if (state is BookSearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BookSearchLoaded) {
                    return _buildSearchResults(state.books);
                  } else if (state is BookSearchError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Shelves',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
        ],
      ),
    );
  }

  Widget _buildInitialContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recommended for You',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 200.0,
            child: Center(
              child: Text('Recommended books will appear here'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Friends Activity',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 200.0,
            child: Center(
              child: Text('Friend activity will appear here'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<Book> books) {
    if (books.isEmpty) {
      return const Center(
        child: Text('No books found. Try a different search.'),
      );
    }
    
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return BookCard(
          book: book,
          onTap: () {
            // Navigate to book details page
          },
        );
      },
    );
  }
} 