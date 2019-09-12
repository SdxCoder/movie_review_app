

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_review_app/core/error/failure.dart';
import 'package:movies_review_app/core/repository_contracts/movie_reviews_repository.dart';
import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';

class GetMovieReviews extends Equatable{

  final IMovieReviewRepository iMovieReviewRepository;

  GetMovieReviews({@required this.iMovieReviewRepository}) : super([iMovieReviewRepository]);


  Future<Either<IFailure, MovieReview>> execute({@required movieName}) async{
    if(movieName == null){
      return null;
    }
      
    return iMovieReviewRepository.getMovieReviews(movieName);
  }

}