import 'package:flutter/material.dart';
import 'package:sports_app/utils/modified_text.dart';

import 'details.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tv);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Popular TV Shows", size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                var movie = tv[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Details(
                        title: movie['title'] ?? 'Loading',
                        description: movie['overview'] ?? 'Loading',
                        bannerurl: movie['backdrop_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}'
                            : 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                        vote: movie['vote_average'].toString(),
                        poster_url: 'https://image.tmdb.org/t/p/w500' +
                            movie['poster_path'],
                        launch_on: movie['first_air_date'] ?? '',
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
                          child: Text(movie["name"] != null
                              ? movie['name']
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
