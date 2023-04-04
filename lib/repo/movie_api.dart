import 'package:tmdb_api/tmdb_api.dart';

class MovieApi {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  Map details = Map();

  final String apiKey = "6b1964cf6df0c6e87767d1a644a90622";
  final readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YjE5NjRjZjZkZjBjNmU4Nzc2N2QxYTY0NGE5MDYyMiIsInN1YiI6IjVlZDNjOWMyYWFlYzcxMDAxZjZlNDU0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yN5-GduUMfxTYSL4vMSucCXflyNDJWFd2KFus_3VxlQ";

  Future<void> loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    trendingMovies = trendingResult["results"];

    Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    topRatedMovies = topratedResult["results"];

    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    tv = tvResult["results"];
  }

  Future<void> getMovieDetails(int movieId) async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    details = await tmdbWithCustomLogs.v3.movies.getDetails(movieId);
  }
}
