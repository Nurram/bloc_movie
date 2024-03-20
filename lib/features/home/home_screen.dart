import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/features/home/bloc/movies_bloc.dart';
import 'package:movie_bloc/shared/widgets/error_screen.dart';
import 'package:movie_bloc/shared/widgets/movie_list.dart';
import 'package:movie_bloc/shared/widgets/movie_list_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => MoviesBloc()..add(LoadMoviesEvent()),
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesError) {
                return CustomErrorWidget(
                  error: state.error,
                  onReload: () {
                    context.read<MoviesBloc>().add(LoadMoviesEvent());
                  },
                );
              }

              if (state is MoviesLoading) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 9 / 16),
                  itemBuilder: (context, index) {
                    return const MovieListLoading();
                  },
                );
              } else if (state is MoviesLoaded) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration.zero, () {
                      context.read<MoviesBloc>().add(LoadMoviesEvent());
                    });
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 9 / 16),
                    itemCount: state.response.results.length,
                    itemBuilder: (context, index) {
                      return MovieList(
                        movie: state.response.results[index],
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
