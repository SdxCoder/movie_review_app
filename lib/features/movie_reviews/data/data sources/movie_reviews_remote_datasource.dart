

import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

abstract class IMovieReviewRemoteDataSource {

  /// Throws [Server Exception] on http error codes
  /// Throws [NetworkException] on no netwrok 
  Future<List<MovieReviewModel>> getMoviewReviews(String movieName);
}