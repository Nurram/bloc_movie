import 'package:get_it/get_it.dart';
import 'package:movie_bloc/core/network/remote_datasource.dart';
import 'package:movie_bloc/models/movie_response.dart';

class MovieRepository {
  final remoteDataSource = GetIt.I.get<RemoteDataSource>();

  Future<MovieResponse> getMovies() async {
    final response = await remoteDataSource.get(endpoint: '/discover/movie');
    return MovieResponse.fromJson(response.data);
  }
}
