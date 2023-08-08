class ApiConstants {
  static const String movieApiKey = "501a75141292989b502dcc5a5644f154";
  static const String baseUrl = "https://api.themoviedb.org/";
}

enum ApiStatus {
  success(200),
  networkFailure(300),
  internalServerError(401),
  unknownFailure(404);

  const ApiStatus(this.value);

  final int value;
}
