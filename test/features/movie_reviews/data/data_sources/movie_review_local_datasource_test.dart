import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/core/shared_services/shared_prefs.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPrefs extends Mock implements SharedPrefs {}

void main(){
  MockSharedPrefs mockSharedPrefs;
  MovieReviewLocalDataSource movieReviewLocalDataSource;


  setUp((){
    mockSharedPrefs = MockSharedPrefs();
    movieReviewLocalDataSource = MovieReviewLocalDataSource(mockSharedPrefs);
  });

  final moviewReviewList = [MovieReviewModel(displayTitle: "test", headline: "test", summary: "test")];
  test('should save movie reviews to disk' , () async {
    


  });

  test('should return movie reviews when there is cached data' , () async {
  
    when(mockSharedPrefs.getFromDisk(MOVIE_REVIEWS_KEY))
        .thenReturn(fixtureReader('response.json'));

    final actual = await movieReviewLocalDataSource.getLastMovieReviews();

    verify(mockSharedPrefs.getFromDisk(MOVIE_REVIEWS_KEY));
    expect(actual, TypeMatcher<List<MovieReviewModel>>());

  });

  test('should throw exception when there is no cached data' , () async {
  
    when(mockSharedPrefs.getFromDisk(any))
        .thenReturn(null);

    final call = movieReviewLocalDataSource.getLastMovieReviews;

    expect(() => call(), throwsA(TypeMatcher<CacheException>()));

  });
}