import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_clean_architecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_clean_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic body) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 401:
        throw UnAuthorizedException(response.body.toString());
      case 404:
        throw InValidInputException(response.body);
      default:
        throw FetchDataException(
            "Error occurred while communicating with the server with status code ${response.statusCode}");
    }
  }
}
