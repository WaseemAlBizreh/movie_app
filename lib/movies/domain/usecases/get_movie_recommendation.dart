import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
