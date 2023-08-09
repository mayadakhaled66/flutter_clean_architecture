import 'package:flutter_clean_archticture/movies/data/datascource/base_movie_data_source.dart';
import 'package:flutter_clean_archticture/movies/data/repository/movie_repository.dart';
import 'package:flutter_clean_archticture/movies/domain/repository/base_movie_repository.dart';
import 'package:flutter_clean_archticture/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator
      .registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());

  serviceLocator.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(serviceLocator()));

  serviceLocator.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase(serviceLocator()));
  serviceLocator
      .registerFactory<MoviesBloc>(() => MoviesBloc(serviceLocator()));
}
