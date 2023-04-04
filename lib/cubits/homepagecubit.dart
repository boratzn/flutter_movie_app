import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/movie_api.dart';

class HomePageCubit extends Cubit<dynamic> {
  HomePageCubit() : super(<dynamic>[]);

  var frepo = MovieApi();

  List trendingMovies = [];
  List topratedMovies = [];
  List tv = [];
  Map details = Map();

  Future<void> loadTrendingMovies() async {
    await frepo.loadMovies();
    trendingMovies = frepo.trendingMovies;

    emit(trendingMovies);
  }

  Future<void> loadTopRatedMovies() async {
    await frepo.loadMovies();
    topratedMovies = frepo.topRatedMovies;

    emit(topratedMovies);
  }

  Future<void> loadTV() async {
    await frepo.loadMovies();
    tv = frepo.tv;

    emit(tv);
  }

  Future<void> getMovieDetails(int movieId) async {
    await frepo.getMovieDetails(movieId);
    details = frepo.details;

    emit(details);
  }
}
