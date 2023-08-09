import 'package:flutter_clean_archticture/core/network/api_constants.dart';

class MovieUrls {
  static const String movieNowPlayingUrl = "${ApiConstants.baseUrl}3/movie/now_playing?api_key=${ApiConstants.movieApiKey}";
}
