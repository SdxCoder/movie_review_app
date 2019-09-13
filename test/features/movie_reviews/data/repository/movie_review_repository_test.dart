import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_review_app/core/platform/network_info_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

class MockMovieReviewRemoteDS extends Mock implements IMovieReviewRemoteDataSource{}
class MockMovieReviewLocalDS extends Mock implements IMovieReviewLocalDataSource{}
class MockNetworkInfo extends Mock implements INetworkInfo{}

void main(){
  IMovieReviewRemoteDataSource iMovieReviewRemoteDataSource;
  IMovieReviewLocalDataSource iMovieReviewLocalDataSource;
  INetworkInfo iNetworkInfo;

   setUp((){
     
     iMovieReviewRemoteDataSource = MockMovieReviewRemoteDS();
     iMovieReviewLocalDataSource = MockMovieReviewLocalDS();
     iNetworkInfo = MockNetworkInfo();

   });

   final List<MovieReviewModel> list = [MovieReviewModel(displayTitle: "test", headline: "test",summary: "test")];

  
}