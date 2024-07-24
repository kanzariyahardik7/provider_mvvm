import 'package:flutter/material.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/utils/routes/rout_animation.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/view/home.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/view/authorization/login.dart';
import 'package:provider_test/view/product.dart';
import 'package:provider_test/view/authorization/signup.dart';
import 'package:provider_test/view/splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RoutesName.product:
        return RoutAnimation().normalPageAnimation(const ProductPage());
      // return MaterialPageRoute(builder: (_) => const ProductPage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (_) => const SignUp());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
                child: MyText(
              text: "No Routes defined",
              color: black0,
              fontsize: 25,
              fontweight: FontWeight.w700,
            )),
          );
        });
    }
  }
}
