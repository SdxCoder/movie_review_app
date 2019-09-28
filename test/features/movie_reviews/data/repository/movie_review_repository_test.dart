import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';
import 'package:movies_review_app/core/shared_services/network_info.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';
import 'package:movies_review_app/features/movie_reviews/data/repository/movie_reviews_repository.dart';

class MockMovieReviewRemoteDS extends Mock implements IMovieReviewRemoteDataSource{}
class MockMovieReviewLocalDS extends Mock implements IMovieReviewLocalDataSource{}
class MockNetworkInfo extends Mock implements INetworkInfo{}

void main(){
  MovieReviewRepository movieReviewRepository;
  MockMovieReviewRemoteDS mockMovieReviewRemoteDS;
  MockMovieReviewLocalDS mockMovieReviewLocalDS;
  MockNetworkInfo mockNetworkInfo;

   setUp((){
    
     mockMovieReviewRemoteDS = MockMovieReviewRemoteDS();
     mockMovieReviewLocalDS = MockMovieReviewLocalDS();
     mockNetworkInfo = MockNetworkInfo();
     movieReviewRepository = MovieReviewRepository(localDataSource: mockMovieReviewLocalDS, 
      remoteDataSource: mockMovieReviewRemoteDS, 
      networkInfo: mockNetworkInfo,);

   });

   
  final List<MovieReviewModel> movieReviewlist = [MovieReviewModel(displayTitle: "test", headline: "test",summary: "test")];
  final movieName = 'movie';

  test('should check if the device is connected', () async {

    when(mockNetworkInfo.getConnectivityStatus()).thenAnswer((_) async {
      return true;
    });

    movieReviewRepository.getMovieReviews(movieName);

    verify(mockNetworkInfo.getConnectivityStatus());

  });

  group('device is online', (){
    final networkStatus = true;
    setUp((){
      when(mockNetworkInfo.getConnectivityStatus()).thenAnswer((_) async {
        return networkStatus;
      });
    });

    test('should return moview review list when call to remote data source is successful', () async{
      when(mockMovieReviewRemoteDS.getMoviewReviews(any)).thenAnswer((_) async{
        return movieReviewlist;
      });

      final actual = await movieReviewRepository.getMovieReviews(movieName);
      verify(mockMovieReviewRemoteDS.getMoviewReviews(movieName));
      verify(mockMovieReviewLocalDS.saveMovieReviews(movieReviewlist));
      expect(actual, Right(movieReviewlist)); 
      
    });

     

    test('should return moview review list when call to remote data source is unsuccessful', () async{
     
      when(mockMovieReviewRemoteDS.getMoviewReviews(any)).thenThrow(ServerException());

      final actual = await movieReviewRepository.getMovieReviews(movieName);
      verify(mockMovieReviewRemoteDS.getMoviewReviews(movieName));
      verifyZeroInteractions(mockMovieReviewLocalDS);
      expect(actual, Left(ServerFailure())); 
      
    });

  });

  group('device is offine', (){

    setUp((){
      when(mockNetworkInfo.getConnectivityStatus()).thenAnswer((_) async {
        return false;
      });
    });


    test('should return cached local data when cache data is present', () async {
      when(mockMovieReviewLocalDS.getLastMovieReviews()).thenAnswer((_) async {
        return movieReviewlist;
      });

      final actual = await movieReviewRepository.getMovieReviews(movieName);
      verify(mockMovieReviewLocalDS.getLastMovieReviews());
      verifyZeroInteractions(mockMovieReviewRemoteDS);
      expect(actual, Right(movieReviewlist));
    });


     test('should return Cache Failure when cache data is not present', () async {
      when(mockMovieReviewLocalDS.getLastMovieReviews()).thenThrow(CacheException());

      final actual = await movieReviewRepository.getMovieReviews(movieName);
      verify(mockMovieReviewLocalDS.getLastMovieReviews());
      verifyZeroInteractions(mockMovieReviewRemoteDS);
      expect(actual, Left(CacheFailure()));
    });

  });



  
}