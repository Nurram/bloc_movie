part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailResponse detail;

  MovieDetailLoaded({required this.detail});
}

final class MovieDetailError extends MovieDetailState {
  final String error;

  MovieDetailError({required this.error});
}
