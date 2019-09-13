import 'package:dartz/dartz.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';
import 'package:movies_review_app/core/platform/network_info_interface.dart';
import 'package:movies_review_app/core/repository/movie_reviews_repository_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource_interface.dart';
import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';
import 'package:meta/meta.dart';

class MovieReviewRepository implements IMovieReviewRepository {
  final IMovieReviewRemoteDataSource remoteDataSource;
  final IMovieReviewLocalDataSource localDataSource;
  final INetworkInfo networkInfo;
  
  MovieReviewRepository({
    @required this.networkInfo, 
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<IFailure, List<MovieReview>>> getMovieReviews(String movieName) {
    // TODO: implement getMovieReviews

    return null;
  }
}
