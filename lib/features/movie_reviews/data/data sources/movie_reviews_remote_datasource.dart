import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';

import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

abstract class IMovieReviewRemoteDataSource {

  /// Throws [Server Exception] on http error codes
  Future<List<MovieReviewModel>> getMoviewReviews(String movieName);
}


class MovieReviewRemoteDataSource implements IMovieReviewRemoteDataSource{
  final Client client;

  MovieReviewRemoteDataSource({@required this.client});

  // static const String _url =  "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query={movie}&api-key=qXHNnL5cFu1okFi3dfBCkPtEIJ28KC8V";
     static const String _url = "http://www.omdbapi.com/?s={movie}&apikey=d4657ac9";
  @override
  Future<List<MovieReviewModel>> getMoviewReviews(String movieName) async {
    List<MovieReviewModel> movieReviews = [];
    
    await client
            .get(Uri.parse(_url.replaceFirst("{movie}", movieName)))
            .then((response) {
              if(response.statusCode == 200) {return response.body;}
              else { throw ServerException(); }
              
            })
            .then(json.decode)
            .then(
              (json) {
                if(json['Search'] == null) throw ServerException();
                json['Search'].forEach((map) => movieReviews.add(MovieReviewModel.fromJson(map)));
              }
              );
            
    return movieReviews;
  }
 

}