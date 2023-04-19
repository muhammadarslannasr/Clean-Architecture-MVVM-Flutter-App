import 'package:flutter_mvvm_clean_architecture/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed({required this.data}) : status = Status.COMPLETED;
  ApiResponse.error({required this.message}) : status = Status.ERROR;

  @override
  String toString(){
    return "status: $status \n message: $message \n data: $data";
  }

}
