
import 'package:flutter_mvvm_clean_architecture/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_clean_architecture/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_clean_architecture/model/movies_list_model.dart';
import 'package:flutter_mvvm_clean_architecture/res/app_url.dart';

class HomeRepository{

  final BaseApiServices _apiServices = NetworkApiService();

  Future<MoviesListModel> moviesListApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListApiEndPoint);
      print('response: ${response}');
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}
