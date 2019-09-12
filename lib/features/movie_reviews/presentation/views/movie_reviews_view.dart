import 'package:flutter/material.dart';



class MovieReviewsView extends StatefulWidget {
  const MovieReviewsView({Key key}) : super(key: key);

  @override
  _MovieReviewsViewState createState() => _MovieReviewsViewState();
}

class _MovieReviewsViewState extends State<MovieReviewsView> {

  final _textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Reviews"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _buildMoviesList(),
          _searchMoviesBtn(context)
        ],
      ),
    );
  }

  Widget _buildMoviesList(){
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index){
          return Text("$index");
        },
      ),
    );
  }

  Widget _searchMoviesBtn(context){
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
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.search),
            hintText: "Search Movies....",
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide(
                width: 1, 
                style: BorderStyle.solid,
            ),
            )
            )
          ),
        ),
      );
  }
}