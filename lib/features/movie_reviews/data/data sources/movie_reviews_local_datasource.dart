

import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

abstract class IMovieReviewLocalDataSource{

  // Get latest cached movie reviews 
  /// Throws [Cache Exception] when there is no locally stored data
  Future<List<MovieReviewModel>> getLastMovieReviews();

  Future<void> saveMovieReviews(List<MovieReviewModel> movies);
}