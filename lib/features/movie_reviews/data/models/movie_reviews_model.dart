import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';

class MovieReviewModel extends MovieReview {
  
  MovieReviewModel({String displayTitle, String headline, String summary})
      : super(headline: headline, 
               summary: summary,
                displayTitle: displayTitle);


  factory MovieReviewModel.fromJson(Map<String, dynamic> json){
    return MovieReviewModel(
      displayTitle : json['Title'].toString(),
      headline: json['headline'].toString(),
      summary : json['Poster'].toString()
    );
  } 


   Map<String, dynamic> toJson(){
    return {
      'Title' : this.displayTitle,
      'headline' : this.headline,
      'Poster' : this.summary
    };
  }

}
