import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/utils/utils.dart';
import 'package:provider_test/viewmodel/auth_viewmodel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height * 0.065,
                  decoration: BoxDecoration(
                      border: Border.all(color: black0),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email",
                        border: InputBorder.none),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                  height: MediaQuery.sizeOf(context).height * 0.065,
                  decoration: BoxDecoration(
                      border: Border.all(color: black0),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _passwordVisible = !_passwordVisible;
                              setState(() {});
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            )),
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Password",
                        border: InputBorder.none),
                  )),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    signupApi();
                  },
                  child: authViewModel.laodingSignUp == true
                      ? const CircularProgressIndicator()
                      : const MyText(
                          text: "SignUp",
                          color: black0,
                          fontsize: 18,
                          fontweight: FontWeight.w600,
                        )),
            ],
          ),
        ),
      ),
    );
  }

  signupApi() {
    if (emailController.text.isEmpty) {
      Utils.flushbar("Enter Email", context);
    } else if (emailController.text.contains("@") == false) {
      Utils.flushbar("Enter valid email formate", context);
    } else if (passwordController.text.length < 6) {
      Utils.flushbar("Enter min 6 dig password", context);
    } else if (passwordController.text.isEmpty) {
      Utils.flushbar("Enter password", context);
    } else {
      Map signupMap = {
        // "email": emailController.text.toString(),
        // "password": emailController.text.toString()

        "email": 'eve.holt@reqres.in',
        "password": 'pistol'
      };
      authViewModel.signup(signupMap, context);
    }
  }
}
