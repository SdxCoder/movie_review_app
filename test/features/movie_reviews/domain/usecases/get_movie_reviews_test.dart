

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_review_app/core/repository/movie_reviews_repository_interface.dart';
import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';
import 'package:movies_review_app/features/movie_reviews/domain/usecases/get_movie_reviews.dart';


class MockMovieReviewsRepository  extends Mock implements IMovieReviewRepository {}

void main(){
  IMovieReviewRepository mockMovieReviewsRepository;
  GetMovieReviews getMovieReviews;

  setUp((){
    mockMovieReviewsRepository = MockMovieReviewsRepository();
    getMovieReviews = GetMovieReviews(iMovieReviewRepository: mockMovieReviewsRepository);
  });

  final List<MovieReview> movieReview = [MovieReview(summary: "test",headline: "test headline", displayTitle: "test title")];


  test("should return movie reviews", () async{
    // arrange
    when(mockMovieReviewsRepository.getMovieReviews(any)).thenAnswer((_) async {
      return Right(movieReview);
    });
    // act
     final result = await getMovieReviews.execute(movieName : 'saad');

    //assert
    expect(result, Right(movieReview));
    verify(mockMovieReviewsRepository.getMovieReviews('saad'));

  });

   test("should return failure if movie name is null", () async{
    // arrange
    when(mockMovieReviewsRepository.getMovieReviews(any)).thenAnswer((_) async {
      return Right(movieReview);
    });
    // act
     final result = await getMovieReviews.execute(movieName : null);

    //assert
    expect(result, null);
    verifyNever(mockMovieReviewsRepository.getMovieReviews(null));

  });


}