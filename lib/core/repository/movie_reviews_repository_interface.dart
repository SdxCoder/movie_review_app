


import 'package:dartz/dartz.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';
import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';

abstract class IMovieReviewRepository{
  Future<Either<IFailure, List<MovieReview>>> getMovieReviews(String movieName);
}

