import 'package:flutter/material.dart';
import 'package:movie_bloc/models/movie_detail_response.dart';
import 'package:movie_bloc/shared/helper/date_helper.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailWidget extends StatelessWidget {
  final MovieDetailResponse response;

  const DetailWidget({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${response.posterPath}',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          _header(),
          const Divider(),
          _overview()
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            response.title,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                formatDate(pattern: 'dd MMMM yyyy', date: response.releaseDate),
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                response.voteAverage.toStringAsFixed(2),
                style: const TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _overview() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            response.overview,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
