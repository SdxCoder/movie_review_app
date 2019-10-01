import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';

import 'package:movies_review_app/core/shared_services/base_model.dart';
import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';
import 'package:movies_review_app/features/movie_reviews/domain/usecases/get_movie_reviews.dart';

class MovieReviewsViewModel extends BaseModel {
  final GetMovieReviews moviewReviewsUsecase;

  MovieReviewsViewModel({@required this.moviewReviewsUsecase});

  List<MovieReview> _reviews;
  var _error;

  List<MovieReview> get reviews => _reviews;
  get error => _error;


  Future<void> getMovieReviews(String movieName) async {
    setBuzy(true);
    Either<IFailure, List<MovieReview>> either =
        await moviewReviewsUsecase.execute(movieName: movieName);

    either.fold(
      (failure) => _error = failure,
      (reviews) => _reviews = reviews,
    );
    setBuzy(false);
  }
}
