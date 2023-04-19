import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/res/components/round_button.dart';
import 'package:flutter_mvvm_clean_architecture/utils/routes/route_name.dart';
import 'package:flutter_mvvm_clean_architecture/utils/utils.dart';
import 'package:flutter_mvvm_clean_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
              ),
              onFieldSubmitted: (value) => Utils.fieldFocusChange(
                  context: context,
                  current: _emailFocusNode,
                  nextFocus: _passwordFocusNode),
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  obscuringCharacter: '*',
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    label: const Text('Password'),
                    prefixIcon: const Icon(Icons.lock_open_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(
                        _obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter email', context: context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter password', context: context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter 6 digit password',
                      context: context);
                } else {
                  Map data = {
                    "email": _emailController.text,
                    "password": _passwordController.text
                  };

                  authViewModel.loginApi(data: data, context: context);
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RouteName.signUp),
              child: Text(
                "Don't have an account? Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
