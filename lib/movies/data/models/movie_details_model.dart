import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List<GenresModel>.from(json['genres'].map(
        (e) => GenresModel.fromJson(e),
      )),
    );
  }
}
