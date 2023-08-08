import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture/core/Error/Failure.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, NowPlayingMovies>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
