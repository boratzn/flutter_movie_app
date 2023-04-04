import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sports_app/cubits/homepagecubit.dart';
import 'package:sports_app/utils/modified_text.dart';

class Details extends StatelessWidget {
  final String title, description, bannerurl, vote, poster_url, launch_on;

  const Details(
      {super.key,
      required this.title,
      required this.description,
      required this.bannerurl,
      required this.vote,
      required this.poster_url,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
          child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: 5,
                    bottom: 5,
                    child: modified_text(
                      text: ' ⭐ Average Rating - ' + vote,
                      size: 18,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: title,
                size: 24,
              )),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text(
              text: 'Release Date : ' + launch_on,
              size: 14,
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(poster_url),
              ),
              Flexible(
                child: Container(
                  child: modified_text(
                    text: description,
                    size: 18,
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
