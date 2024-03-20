import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc/core/repositories/movie_repository.dart';
import 'package:movie_bloc/models/movie_response.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final movieRepository = GetIt.I.get<MovieRepository>();

  MoviesBloc() : super(MoviesInitial()) {
    on<LoadMoviesEvent>((event, emit) async {
      emit(MoviesLoading());

      try {
        final response = await movieRepository.getMovies();
        emit(MoviesLoaded(response: response));
      } catch (e) {
        emit(MoviesError(error: e.toString()));
      }
    });
  }
}
