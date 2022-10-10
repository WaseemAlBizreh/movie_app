import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../../../movies/data/models/movie_model.dart';
import '../../../movies/domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_movie_recommendation.dart';
import '../models/movie_details_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      throw '${e.error}';
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await Dio().get(ApiConstants.popularMoviesPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      throw '${e.error}';
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await Dio().get(ApiConstants.topRatedMoviesPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      throw '${e.error}';
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final response = await Dio().get(
        ApiConstants.movieDetailsPath(parameters.movieId),
      );
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      throw '${e.error}';
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameters parameters) async {
    try {
      final response = await Dio().get(
        ApiConstants.movieRecommendationPath(parameters.movieId),
      );
      if (response.statusCode == 200) {
        return List<RecommendationModel>.from(
            (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioError catch (e) {
      throw '${e.error}';
    }
  }
}
