import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_clean_architecture/model/user_model.dart';
import 'package:flutter_mvvm_clean_architecture/utils/routes/route_name.dart';
import 'package:flutter_mvvm_clean_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async  {
    await getUserData().then((value)  => {

      print('token_is: ${value.token}'),


      if(value.token != 'null'){
        //await Future.delayed(Duration(seconds: 3)),
        Navigator.pushNamed(context, RouteName.home),
        print('token Not Empty')

      }else{

        //await Future.delayed(Duration(seconds: 3)),
        Navigator.pushNamed(context, RouteName.login),

        print('token Empty')


      }

    }).onError((error, stackTrace) => {
      print('Error ${error.toString()}')
    });
  }
}
