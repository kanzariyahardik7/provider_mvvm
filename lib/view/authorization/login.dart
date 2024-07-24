import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/universal_widget/full_button.dart';
import 'package:provider_test/utils/utils.dart';
import 'package:provider_test/universal_widget/logo.dart';
import 'package:provider_test/universal_widget/textfield.dart';
import 'package:provider_test/view/authorization/widget/bottom_text.dart';
import 'package:provider_test/viewmodel/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthViewModel authViewModel;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                // logo
                const Logo(),
                // login textfield - email
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  text: email,
                  hintText: "Enter Email",
                  maxlines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                // login text field - password
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  text: password,
                  hintText: "Enter Password",
                  maxlines: 1,
                  isPasswordField: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                // login button
                const SizedBox(
                  height: 60,
                ),
                FullButton(
                  ontap: () {
                    loginApi();
                  },
                  title: "Login",
                ),
                // register text
                const SizedBox(
                  height: 20,
                ),
                const BottomText(
                  pageName: "Login",
                ),
              ],
            ),
          ),
          authViewModel.laoding == true
              ? Utils.loadingCircle()
              : const SizedBox.shrink()
        ],
      ),
    );
  }

//eve.holt@reqres.in -- cityslicka
// "token": "QpwL5tke4Pnpja7X4"
  loginApi() {
    if (email.isEmpty) {
      Utils.flushbar("Enter Email", context);
    } else if (email.contains("@") == false) {
      Utils.flushbar("Enter valid email formate", context);
    } else if (password.length < 6) {
      Utils.flushbar("Enter min 6 dig password", context);
    } else if (password.isEmpty) {
      Utils.flushbar("Enter password", context);
    } else {
      // Map loginMap = {
      //   "email": email.toString(),
      //   "password": password.toString()
      // };

      Map loginMap = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

      authViewModel.login(loginMap, context);
    }
  }
}
