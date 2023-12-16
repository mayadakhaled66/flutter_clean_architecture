// To parse this JSON data, do
//
//     final nowPlayingMovies = nowPlayingMoviesFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';

NowPlayingMoviesModel nowPlayingMoviesFromJson(String str) => NowPlayingMoviesModel.fromJson(json.decode(str));

String nowPlayingMoviesModelToJson(NowPlayingMoviesModel data) => json.encode(data.toJson());

class NowPlayingMoviesModel extends NowPlayingMovies{
  NowPlayingMoviesModel({required super.dates, required super.page, required super.results, required super.totalPages, required super.totalResults});

  factory NowPlayingMoviesModel.fromJson(Map<String, dynamic> json) => NowPlayingMoviesModel(
    dates: Dates.fromJson(json["dates"]),
    page: json["page"],
    results: List<Result>.from(json["results"]??[].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}


