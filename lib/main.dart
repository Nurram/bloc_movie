import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc/core/network/remote_datasource.dart';
import 'package:movie_bloc/core/repositories/movie_repository.dart';
import 'package:movie_bloc/features/home/home_screen.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  _injectAll();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

_injectAll() {
  final get = GetIt.instance;

  get.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(baseUrl: dotenv.env['BASE_URL']!, headers: {
          "accept": "application/json",
        }),
      );

      if (kDebugMode) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
        ));
      }

      return dio;
    },
  );
  get.registerLazySingleton(() => RemoteDataSource());
  get.registerLazySingleton(() => MovieRepository());
}
