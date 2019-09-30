import 'dart:convert';

import 'package:matcher/matcher.dart';
import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

import '../../../../fixtures/fixture_reader.dart';



class MockHttpClient extends Mock implements Client {}

void main(){
  MovieReviewRemoteDataSource movieReviewRemoteDataSource;
  MockHttpClient mockHttpClient;

  setUp((){
    mockHttpClient = MockHttpClient();
    movieReviewRemoteDataSource = MovieReviewRemoteDataSource(client: mockHttpClient);
  });

   final String movie = "john wick";
   final String urlString = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=john wick&api-key=qXHNnL5cFu1okFi3dfBCkPtEIJ28KC8V";
   final url = Uri.parse(urlString.replaceFirst("{movie}", movie));
   
  test('should return list of movie reviews model when status code is 200 ', () async {
    final list = [];
    final response = Response(fixtureReader('response.json'), 200);
    when(mockHttpClient.get(url)).thenAnswer((_) async {
      return response;
    });

    final actual = await movieReviewRemoteDataSource.getMoviewReviews(movie);
    final result = json.decode(response.body);
    result['results'].forEach((map) => list.add(MovieReviewModel.fromJson(map)));

    verify(mockHttpClient.get(url));
    expect(actual, list);
   
  });


  test('should throw server exception when status code is not 200', () async {
     final response1 = Response(fixtureReader('response.json'), 400);
    when(mockHttpClient.get(url)).thenAnswer((_) async {
      return response1;
    });

    final call = movieReviewRemoteDataSource.getMoviewReviews;


    expect( () => call(movie), throwsA(TypeMatcher<ServerException>()));
  });


  
}