import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture/core/Error/Failure.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, NowPlayingMovies>> getNowPlayingMovies();
}
