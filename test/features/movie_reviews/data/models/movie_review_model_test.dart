import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_review_app/features/movie_reviews/data/models/movie_reviews_model.dart';

import '../../../../fixtures/fixture_reader.dart';


void main(){
 
 final movieReviewModel = MovieReviewModel(headline: "test headline", displayTitle: "test title", summary: "test summary");
  
  group('from Json', () {
     test('should return the movie review model instance from valid json', () async {
    // arrange
     final Map<String, dynamic> response = json.decode(fixtureReader('valid_movie_review.json'));

    // act
    final result = MovieReviewModel.fromJson(response);

    // assert
    expect(result, movieReviewModel);
  });

  final movieReviewModel2 = MovieReviewModel(headline: "test headline", displayTitle: "1.0", summary: "test summary");
  test('should return the movie review model instance from invalid json', () async {
    // arrange
     final Map<String, dynamic> response = json.decode(fixtureReader('invalid_movie_review.json'));

    // act
    final result = MovieReviewModel.fromJson(response);

    // assert
    expect(result, movieReviewModel2);
  });

  });


  group('to json', (){
    test('should return json map', () async {
      // arrange 
      final model = MovieReviewModel(headline: "test headline", displayTitle: "test title", summary: "test summary");
      // act
      final response = model.toJson();

      final expectedMap = {
        'headline' : 'test headline',
        'displayTitle' : 'test title',
        'summary' : 'test summary'
      };

      // assert
      expect(response, expectedMap);

    });
  });
 
}