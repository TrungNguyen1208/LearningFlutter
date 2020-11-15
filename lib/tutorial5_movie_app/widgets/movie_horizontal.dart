import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial5_movie_app/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movieList;
  final Function doLoadMore;

  MovieHorizontal({@required this.movieList, @required this.doLoadMore});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200 && doLoadMore != null) {
        doLoadMore();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      padding: EdgeInsets.only(left: 0.0),
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas(context),
        itemCount: movieList.length,
        itemBuilder: (context, index) =>
            _buildCardMovie(context, movieList[index]),
      ),
    );
  }

  Widget _buildCardMovie(BuildContext context, Movie movie) {
    movie.uniqueId = '${movie.id}-poster';

    final cardMovie = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImg()),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {},
      child: cardMovie,
    );
  }
}
