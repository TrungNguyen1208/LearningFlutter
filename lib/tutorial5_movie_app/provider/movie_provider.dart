import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning_flutter/tutorial5_movie_app/models/movie_model.dart';

class MovieProvider {
  String _apiKey = '95fe8dea25d9ca393d8f89c52f789fe2';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularPage = 0;
  bool _isLoading = false;

  List<Movie> _popularMovies = new List();

  final _popularMovieStreamController = StreamController<
      List<Movie>>.broadcast();

  Function(List<Movie>) get _popularMovieSink =>
      _popularMovieStreamController.sink.add;

  Stream<List<Movie>> get popularMovieStream => _popularMovieStreamController.stream;

  void disposeStreams() {
    _popularMovieStreamController?.close();
  }

  Future<List<Movie>> _processRequestData(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final data = new MovieData.fromJsonList(decodedData["results"]);
    return data.movies;
  }

  Future <List<Movie>> getNowMovie() async {
    final url=Uri.https(_url, '3/movie/now_playing',{
      'api_key':_apiKey,
      'language':_language,
    });
    return await _processRequestData(url);
  }

  Future<List<Movie>> getPopularMovie() async {
    if(_isLoading)return [];

    _isLoading = true;
    _popularPage++;

    final url=Uri.https(_url, '3/movie/popular',{
      'api_key':_apiKey,
      'language':_language,
      'page':_popularPage.toString(),
    });
    final resp = await _processRequestData(url);
    _popularMovies.addAll(resp);
    _popularMovieSink(_popularMovies);
    _isLoading = false;
    return resp;
  }
}
