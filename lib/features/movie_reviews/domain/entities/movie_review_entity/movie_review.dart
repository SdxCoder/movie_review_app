

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'movie_review_interfaces.dart';

class MovieReview extends Equatable implements IMovieReview{

  final String displayTitle;
  final String headline;
  final String summary;

  MovieReview({
    @required this.displayTitle,
    @required this.headline,
    @required this.summary}) 
  : super([displayTitle, headline, summary]);

  @override
  void getMovie() {
    print('Display title : $displayTitle\nHeadline : $headline\nSummary: $summary');
  }

}