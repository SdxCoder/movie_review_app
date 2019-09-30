

import 'dart:convert';

import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/core/shared_services/shared_prefs.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IMovieReviewLocalDataSource{

  // Get latest cached movie reviews 
  /// Throws [Cache Exception] when there is no locally stored data
  Future<List<MovieReviewModel>> getLastMovieReviews();

  Future<void> saveMovieReviews(List<MovieReviewModel> movies);
}

const String MOVIE_REVIEWS_KEY = "reviews";

class MovieReviewLocalDataSource implements IMovieReviewLocalDataSource {
   
  final SharedPrefs sharedPrefs;

  MovieReviewLocalDataSource(this.sharedPrefs);



  @override
  Future<List<MovieReviewModel>> getLastMovieReviews() async {
    List<MovieReviewModel> movieReviews = [];
    var jsonString = sharedPrefs.getFromDisk(MOVIE_REVIEWS_KEY);
    if(jsonString != null){
      var jsonMoviewReviews = json.decode(jsonString);
      jsonMoviewReviews['results'].forEach((map) => movieReviews.add(MovieReviewModel.fromJson(map)));
      return movieReviews;
    }
    else{
      throw CacheException();
    }
    
  }

  @override
  Future<void> saveMovieReviews(List<MovieReviewModel> movies) {
    
    List<Map<String, dynamic>> results = [];
    movies.forEach((movie) => results.add(movie.toJson()));

    Map<String , dynamic>  content = {
      "results" : results
    };
    
    sharedPrefs.saveToDisk<String>(MOVIE_REVIEWS_KEY, json.encode(content));
  }

}



