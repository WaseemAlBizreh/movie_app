import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/dummy.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;
  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieDetailsContent(
      movie: movieDetailDummy,
      recommendation: recommendationDummy,
    );
  }
}

class MovieDetailsContent extends StatelessWidget {
  final MovieDetails movie;
  final List<Recommendation> recommendation;

  const MovieDetailsContent({
    Key? key,
    required this.movie,
    required this.recommendation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ShaderMask(
                shaderCallback: (rect) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
