import 'package:flutter/material.dart';
import 'package:movies_review_app/core/error/exceptions_interface.dart';
import 'package:movies_review_app/core/error/failure_interface.dart';
import 'package:movies_review_app/core/shared_widgets/base_widget.dart';
import 'package:movies_review_app/features/movie_reviews/presentation/view_models/movie_review_view_model.dart';

class MovieReviewsView extends StatefulWidget {
  const MovieReviewsView({Key key}) : super(key: key);

  @override
  _MovieReviewsViewState createState() => _MovieReviewsViewState();
}

class _MovieReviewsViewState extends State<MovieReviewsView> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: MovieReviewsViewModel(moviewReviewsUsecase: null),
      child: null,
      onReadyModel: null,
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Movie Reviews"),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
               _searchMoviesBtn(context, model),
               (model.reviews == null) ? _buildMoviesList(model) : _showError(context, model),
             
            ],
          ),
        );
      },
    );
  }

  Widget _showError(context, model){
    if(model.error is IFailure){
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Text(model.error.msg),
        ),
      );
    }
  }

  Widget _buildMoviesList(model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.reviews.length,
        itemBuilder: (BuildContext context, int index) {
          return Text("$index");
        },
      ),
    );
  }

  Widget _searchMoviesBtn(context, model) {
    return Container(
      height: 105,
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[200],
      child: Center(
        child: TextFormField(
            controller: _textController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: () async {
                  await model.getMovieReviews(_textController.text);
                },
                child: Icon(Icons.search),
              ),
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.search),
                hintText: "Search Movies....",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ))),
      ),
    );
  }
}
