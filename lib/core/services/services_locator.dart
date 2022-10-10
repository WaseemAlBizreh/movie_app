import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_movies.dart';
import '../../movies/domain/usecases/get_popular_movies.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    getIt.registerFactory<MoviesBloc>(
      () => MoviesBloc(getIt(), getIt(), getIt()),
    );
    getIt.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(getIt()),
    );

    // Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );

    // Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(getIt()),
    );

    // UseCases
    getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase(getIt()),
    );
    getIt.registerLazySingleton<GetPopularMoviesUseCase>(
      () => GetPopularMoviesUseCase(getIt()),
    );
    getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
      () => GetTopRatedMoviesUseCase(getIt()),
    );
    getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(getIt()),
    );
  }
}
