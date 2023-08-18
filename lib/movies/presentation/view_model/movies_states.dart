import 'package:equatable/equatable.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';

class MoviesStates extends Equatable {
  NowPlayingMovies? nowPlayingMovies;
  MoviesStatus moviesStatus;
  String errorMessage;

  MoviesStates({
    this.moviesStatus = MoviesStatus.initial,
    this.nowPlayingMovies,
    this.errorMessage = ""
  });

  @override
  List<Object?> get props => [moviesStatus,nowPlayingMovies,errorMessage];
}

enum MoviesStatus { loading, initial,loaded, error }
