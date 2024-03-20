import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieListLoading extends StatelessWidget {
  const MovieListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
        ),
      ),
    );
  }
}
