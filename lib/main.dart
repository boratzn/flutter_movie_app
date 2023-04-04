import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/cubits/homepagecubit.dart';
import 'package:sports_app/pages/toprated.dart';
import 'package:sports_app/pages/trending.dart';
import 'package:sports_app/pages/tv.dart';
import 'package:sports_app/repo/movie_api.dart';
import 'package:sports_app/utils/modified_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var mrepo = MovieApi();

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().loadTrendingMovies();
    context.read<HomePageCubit>().loadTopRatedMovies();
    context.read<HomePageCubit>().loadTV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const modified_text(
          text: "Flutter Movie App",
          size: 26,
        ),
      ),
      body: BlocBuilder<HomePageCubit, dynamic>(
        builder: (context, state) {
          return ListView(
            children: [
              TrendingMovies(
                trending: context.read<HomePageCubit>().trendingMovies,
              ),
              TopRated(toprated: context.read<HomePageCubit>().topratedMovies),
              TV(tv: context.read<HomePageCubit>().tv)
            ],
          );
        },
      ),
    );
  }
}
