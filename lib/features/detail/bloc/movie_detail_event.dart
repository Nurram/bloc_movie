part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

final class LoadMovieDetail extends MovieDetailEvent {}