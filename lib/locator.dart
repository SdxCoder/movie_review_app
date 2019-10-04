import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_review_app/core/shared_services/network_info.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_local_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/data%20sources/movie_reviews_remote_datasource.dart';
import 'package:movies_review_app/features/movie_reviews/data/repository/movie_reviews_repository.dart';
import 'package:movies_review_app/features/movie_reviews/domain/usecases/get_movie_reviews.dart';

import 'core/shared_services/shared_prefs.dart';


GetIt locator = GetIt.instance;

void setupLocator(){
   locator.registerLazySingleton(() => Client());
   locator.registerLazySingleton(() => SharedPrefs());
   locator.registerLazySingleton(() => NetworkInfo(DataConnectionChecker()));
   locator.registerLazySingleton(() => MovieReviewRemoteDataSource(client: locator<Client>()));
   locator.registerLazySingleton(() => MovieReviewLocalDataSource(locator<SharedPrefs>()));
   locator.registerLazySingleton(
     () => MovieReviewRepository(localDataSource: locator<MovieReviewLocalDataSource>(),
     remoteDataSource: locator<MovieReviewRemoteDataSource>(),networkInfo: locator<NetworkInfo>()));
   locator.registerLazySingleton(() => GetMovieReviews(iMovieReviewRepository: locator<MovieReviewRepository>()));
   
}