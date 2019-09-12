import 'package:movies_review_app/features/movie_reviews/domain/entities/movie_review_entity/movie_review.dart';

class MovieReviewModel extends MovieReview {
  
  MovieReviewModel({String displayTitle, String headline, String summary})
      : super(headline: headline, 
               summary: summary,
                displayTitle: displayTitle);


  factory MovieReviewModel.fromJson(Map<String, dynamic> json){
    return MovieReviewModel(
      displayTitle : json['displayTitle'].toString(),
      headline: json['headline'].toString(),
      summary : json['summary'].toString()
    );
  } 


   Map<String, dynamic> toJson(){
    return {
      'displayTitle' : this.displayTitle,
      'headline' : this.headline,
      'summary' : this.summary
    };
  }

}
