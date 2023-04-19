import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_clean_architecture/model/user_model.dart';
import 'package:flutter_mvvm_clean_architecture/repository/auth_repository.dart';
import 'package:flutter_mvvm_clean_architecture/utils/routes/route_name.dart';
import 'package:flutter_mvvm_clean_architecture/utils/utils.dart';
import 'package:flutter_mvvm_clean_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool _singUpLoading = false;

  bool get loading => _loading;
  bool get signUpLoading => _singUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _singUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(
      {required dynamic data, required BuildContext context}) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        setLoading(false);
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference.saveUser(UserModel(
          token: value['token'].toString(),
        ));

        Utils.flushBarErrorMessage(
            message: 'Login Successfully', context: context);
        Navigator.pushNamed(context, RouteName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(message: error.toString(), context: context);
        print(error.toString());
      }
    });
  }

  Future<void> registerApi(
      {required dynamic data, required BuildContext context}) async {
    setSignUpLoading(true);
    _myRepo
        .signUpApi(data)
        .then((value) => {
              if (kDebugMode)
                {
                  setSignUpLoading(false),
                  Utils.flushBarErrorMessage(
                      message: 'Register Successfully', context: context),
                  Navigator.pushNamed(context, RouteName.home),
                  print(value.toString())
                }
            })
        .onError((error, stackTrace) => {
              if (kDebugMode)
                {
                  setSignUpLoading(false),
                  Utils.flushBarErrorMessage(
                      message: error.toString(), context: context),
                  print(error.toString())
                }
            });
  }
}
