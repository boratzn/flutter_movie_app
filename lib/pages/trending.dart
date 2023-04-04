import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/cubits/homepagecubit.dart';
import 'package:sports_app/pages/details.dart';
import 'package:sports_app/repo/movie_api.dart';
import 'package:sports_app/utils/modified_text.dart';

class TrendingMovies extends StatelessWidget {
  List trending;
  TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Trending Movies", size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                var movie = trending[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Details(
                        title: movie['title'] ?? 'Loading',
                        description: movie['overview'] ?? 'Loading',
                        bannerurl: 'https://image.tmdb.org/t/p/w500' +
                            movie['backdrop_path'],
                        vote: movie['vote_average'].toString(),
                        poster_url: 'https://image.tmdb.org/t/p/w500' +
                            movie['poster_path'],
                        launch_on: movie['release_date'],
                      ),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          movie['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(movie["title"] != null
                                ? movie['title']
                                : "Loading"),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
