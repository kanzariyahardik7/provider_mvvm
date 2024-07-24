import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        checkAuthentication(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Center(
                        child: Icon(
                      Icons.account_balance,
                      size: 70,
                      color: white0,
                    ))),
              ),
              MyText(
                text: "Welcome to Master app",
                color: Theme.of(context).appBarTheme.backgroundColor,
                fontsize: 24,
                fontweight: FontWeight.w600,
              )
            ],
          ),
        )),
      );

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (token == null || token == '') {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    });
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    debugPrint("token token -----?? $token");
  }
}
