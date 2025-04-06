import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/constants/app_config.dart';
import 'package:mobile/core/constants/api_constants.dart';
import 'package:mobile/features/book/data/datasources/book_api.dart';
import 'package:mobile/features/book/domain/blocs/book_search/book_search_bloc.dart';
import 'package:mobile/features/book/domain/repositories/book_repository.dart';
import 'package:mobile/features/book/presentation/pages/home_page.dart';

void main() {
  // Initialize app configuration
  AppConfig.initialize(env: Environment.development);
  
  runApp(const OpenReadsApp());
}

class OpenReadsApp extends StatelessWidget {
  const OpenReadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Core services
        Provider<Dio>(
          create: (context) => Dio(BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
          )),
        ),
        
        // Data sources
        ProxyProvider<Dio, BookApi>(
          update: (context, dio, _) => BookApi(dio),
        ),
        
        // Repositories
        ProxyProvider<BookApi, BookRepository>(
          update: (context, bookApi, _) => BookRepository(bookApi),
        ),
      ],
      child: Builder(
        builder: (context) {
          // Access the repository to pass to BLoCs
          final bookRepository = Provider.of<BookRepository>(context, listen: false);
          
          return MultiBlocProvider(
            providers: [
              BlocProvider<BookSearchBloc>(
                create: (context) => BookSearchBloc(
                  bookRepository: bookRepository,
                ),
              ),
            ],
            child: MaterialApp(
              title: AppConfig.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF1E88E5),
                  brightness: Brightness.light,
                ),
                textTheme: GoogleFonts.nunitoTextTheme(),
                useMaterial3: true,
              ),
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
