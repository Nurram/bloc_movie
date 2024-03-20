import 'package:flutter/material.dart';
import 'package:movie_bloc/models/movie_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieList extends StatelessWidget {
  final Result movie;

  const MovieList({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
