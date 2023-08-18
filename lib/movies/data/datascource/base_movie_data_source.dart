import 'package:flutter_clean_archticture/core/Error/Failure.dart';
import 'package:flutter_clean_archticture/core/network/api_client.dart';
import 'package:flutter_clean_archticture/movies/data/datascource/movie_urls.dart';
import 'package:flutter_clean_archticture/movies/data/models/now_playing_movies_model.dart';

abstract class BaseMovieDataSource {
  Future<NowPlayingMoviesModel> getNowPlaying();
}

class MovieDataSource implements BaseMovieDataSource {
  @override
  Future<NowPlayingMoviesModel> getNowPlaying() async {
    try {
      final response = await NetworkManager()
          .executeGetRequest(MovieUrls.movieNowPlayingUrl);
      return NowPlayingMoviesModel.fromJson(response.data);
    } on ServerFailure catch (error) {
      rethrow ;
    }
  }
}
