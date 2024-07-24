import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/utils/routes/routes_name.dart';

class BottomText extends StatelessWidget {
  final String? pageName;
  const BottomText({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: pageName == "Login"
              ? "Don't have account? "
              : "Already have an Account",
          color: Theme.of(context).primaryColor,
          fontsize: 15,
          fontweight: FontWeight.w600,
        ),
        InkWell(
          onTap: () {
            pageName == "Login"
                ? Navigator.pushNamed(context, RoutesName.signup)
                : Navigator.pop(context);
          },
          child: MyText(
            text: pageName == "" ? "Sign Up" : "Login",
            color: blue,
            fontsize: 20,
            fontweight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
