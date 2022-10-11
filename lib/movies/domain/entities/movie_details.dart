import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final DateTime releaseDate;
  final int runtime;
  final List<Genres> genres;
  final String title;
  final double voteAverage;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        backdropPath,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
        genres,
      ];
}
