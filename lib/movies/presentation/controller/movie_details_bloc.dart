import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enum.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(movieId: event.id),
    );
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetails: r,
        movieDetailsState: RequestState.loaded,
      )),
    );
  }
}
