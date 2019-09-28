import 'package:dartz/dartz.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';
import 'package:movies_review_app/core/repository/movie_reviews_repository_interface.dart';
import 'package:movies_review_app/core/shared_services/network_info.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource.dart';
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
  Future<Either<IFailure, List<MovieReview>>> getMovieReviews(
      String movieName) async {
    if (await networkInfo.getConnectivityStatus()) {
      try {
        final movieReviews = await remoteDataSource.getMoviewReviews(movieName);
        localDataSource.saveMovieReviews(movieReviews);
        return Right(movieReviews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedReviews = await localDataSource.getLastMovieReviews();
        return Right(cachedReviews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
