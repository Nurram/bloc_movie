part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final MovieResponse response;

  MoviesLoaded({required this.response});
}

final class MoviesError extends MoviesState {
  final String error;

  MoviesError({required this.error});
}
