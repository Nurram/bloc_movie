import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc/core/repositories/movie_repository.dart';
import 'package:movie_bloc/models/movie_detail_response.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final int id;

  final repository = GetIt.I.get<MovieRepository>();

  MovieDetailBloc({required this.id}) : super(MovieDetailInitial()) {
    on<LoadMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());

      try {
        final response = await repository.getDetail(id: id);
        emit(MovieDetailLoaded(detail: response));
      } catch (e) {
        emit(MovieDetailError(error: e.toString()));
      }
    });
  }
}
