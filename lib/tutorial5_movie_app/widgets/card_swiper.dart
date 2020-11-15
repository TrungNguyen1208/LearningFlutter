import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial5_movie_app/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movieList;

  CardSwiper({@required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: Swiper(
        itemWidth: SizeConfig.screenWidth * 0.7,
        itemHeight: SizeConfig.screenHeight * 0.5,
        itemCount: movieList.length,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          final movie = movieList[index];
          movie.uniqueId = '${movie.id}-target';

          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () {},
              child: FadeInImage(
                image: NetworkImage(
                  movie.getPosterImg(),
                ),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
