import 'package:flutter/material.dart';
import 'package:sports_app/utils/modified_text.dart';

import 'details.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({
    Key? key,
    required this.toprated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top Rated Movies", size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                var movie = toprated[index];
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
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          movie['poster_path']))),
                        ),
                        Container(
                          child: Text(movie["title"] != null
                              ? movie['title']
                              : "Loading"),
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
