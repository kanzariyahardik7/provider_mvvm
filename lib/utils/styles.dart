import 'package:flutter/material.dart';
import 'package:provider_test/utils/colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: isDarkTheme
          ? darkTextPrimary
          : lightTextPrimary, // ---> use for primary text
      scaffoldBackgroundColor: isDarkTheme ? darkScaffold : lightScaffold,
      focusColor: isDarkTheme
          ? darkTextSecondary
          : lightTextSecondary, // ---> use for secondary text
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? darkAppBarBg : lightAppBarBg,
        elevation: 0.0,
      ),
      dividerColor:
          isDarkTheme ? white0 : black0, // --use for black and white color
      // canvasColor: isDarkTheme
      //     ? darkAppBarColor
      //     : kPrimaryColor, // ---> navigationbar bg color

      // hintColor: isDarkTheme ? grey : white, // ---> textfield bg color

      // cardColor: isDarkTheme
      //     ? darkAppBarColor
      //     : white, // ---> card ,container bg color

      // highlightColor: isDarkTheme ? white : black, // ---> use for text

      // disabledColor:
      //     isDarkTheme ? darkAppBarColor : white, // ---> use for explore item

      // indicatorColor: isDarkTheme
      //     ? kPrimaryColor
      //     : GenniAppTheme.kPrimaryText, // ---> use for authentication text

      // primarySwatch: isDarkTheme ? Colors.grey : Colors.blue,
      //
      // backgroundColor: isDarkTheme ? Colors.brown : white,

      //
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      //
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
    );
  }
}
