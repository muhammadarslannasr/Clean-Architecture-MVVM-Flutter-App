
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_clean_architecture/data/response/api_response.dart';
import 'package:flutter_mvvm_clean_architecture/model/movies_list_model.dart';
import 'package:flutter_mvvm_clean_architecture/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _homeRepo = HomeRepository();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());
    _homeRepo.moviesListApi().then((value) {

      setMoviesList(ApiResponse.completed(data: value));

    }).onError((error, stackTrace) {
      print('error_is: ${error.toString()}');
      setMoviesList(ApiResponse.error(message: error.toString()));
    });
  }

}