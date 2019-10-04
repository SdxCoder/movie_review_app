
import 'package:flutter/material.dart';
import 'package:movies_review_app/locator.dart';
import 'package:provider/provider.dart';

import 'features/movie_reviews/presentation/views/movie_reviews_view.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: MovieReviewsView()
      );
  }
}