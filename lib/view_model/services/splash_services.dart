import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_clean_architecture/model/user_model.dart';
import 'package:flutter_mvvm_clean_architecture/utils/routes/route_name.dart';
import 'package:flutter_mvvm_clean_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)  {
    getUserData().then((value) async => {

      if(value.token == null ||  value.token == ''){
        await Future.delayed(Duration(seconds: 3)),
        Navigator.pushNamed(context, RouteName.login)
      }else{
        await Future.delayed(Duration(seconds: 3)),
        Navigator.pushNamed(context, RouteName.home)
      }

    }).onError((error, stackTrace) => {

    });
  }
}
