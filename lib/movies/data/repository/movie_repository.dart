import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture/core/Error/Failure.dart';
import 'package:flutter_clean_archticture/movies/data/datascource/base_movie_data_source.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/domain/repository/base_movie_repository.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieDataSource _baseMovieDataSource;

  MovieRepository(this._baseMovieDataSource);

  @override
  Future<Either<Failure, NowPlayingMovies>> getNowPlayingMovies() async {
    try {
      final model = await _baseMovieDataSource.getNowPlaying();
      return Right(model);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }
}
