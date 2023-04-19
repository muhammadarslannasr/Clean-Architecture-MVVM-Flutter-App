import 'package:flutter_mvvm_clean_architecture/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_clean_architecture/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_clean_architecture/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrl.loginApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
      _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}
