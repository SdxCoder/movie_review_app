

import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

abstract class IMovieReviewRemoteDataSource {
  Future<List<MovieReviewModel>> getMoviewReviews(String movieName);
}