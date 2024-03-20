import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/features/detail/bloc/movie_detail_bloc.dart';
import 'package:movie_bloc/shared/widgets/detail_widget.dart';
import 'package:movie_bloc/shared/widgets/error_screen.dart';

import '../../shared/widgets/detail_loading_widget.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String name;

  const DetailScreen({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
      ),
      body: BlocProvider(
        create: (context) => MovieDetailBloc(id: id)..add(LoadMovieDetail()),
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const DetailLoadingWidget();
            } else if (state is MovieDetailLoaded) {
              return DetailWidget(response: state.detail);
            } else if (state is MovieDetailError) {
              return CustomErrorWidget(
                error: state.error,
                onReload: () {
                  context.read<MovieDetailBloc>().add(LoadMovieDetail());
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
