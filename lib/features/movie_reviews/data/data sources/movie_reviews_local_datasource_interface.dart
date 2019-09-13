

import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

abstract class IMovieReviewLocalDataSource{

  // Get latest cached movie reviews 
  
  Future<List<MovieReviewModel>> getMovieReviews();
}