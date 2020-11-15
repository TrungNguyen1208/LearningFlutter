import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial5_movie_app/provider/movie_provider.dart';
import 'package:learning_flutter/tutorial5_movie_app/widgets/card_swiper.dart';
import 'package:learning_flutter/tutorial5_movie_app/widgets/movie_horizontal.dart';

class MovieHomeScreen extends StatelessWidget {
  final movieProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    movieProvider.getPopularMovie();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Home Movie"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_swiperBanner(), _footer(context)],
        ),
      ),
    );
  }

  Widget _swiperBanner() {
    return FutureBuilder(
      future: movieProvider.getNowMovie(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(movieList: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Popular Movie',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          VerticalSpacing(of: 5),
          StreamBuilder(
            stream: movieProvider.popularMovieStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(movieList: snapshot.data, doLoadMore: movieProvider.getPopularMovie,);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
