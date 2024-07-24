import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/data/network/networkapiservices.dart';
import 'package:provider_test/repo/auth_repository.dart';
import 'package:provider_test/repo/activity/activity_repository_impl.dart';
import 'package:provider_test/utils/constant.dart';
import 'package:provider_test/utils/routes/routes.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/utils/styles.dart';
import 'package:provider_test/utils/user_preferences.dart';
import 'package:provider_test/viewmodel/activity_view_model.dart';
import 'package:provider_test/viewmodel/auth_viewmodel.dart';
import 'package:provider_test/viewmodel/generalprovider.dart';
import 'package:provider_test/viewmodel/themechanger.dart';

void main() {
  final NetworkApiServices apiServices = NetworkApiServices();
  // define repository here //
  final ActivityRepositoryImpl homeRepository =
      ActivityRepositoryImpl(apiService: apiServices);
  final AuthRepository authRepository = AuthRepository(apiService: apiServices);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GeneralProivider()),
      ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ChangeNotifierProvider(
          create: (_) => AuthViewModel(authRepository: authRepository)),
      ChangeNotifierProvider(
          create: (_) => ActivityViewModel(homeRepo: homeRepository)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserPreferences darkThemePreference = UserPreferences();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getCurrentAppTheme();
      setState(() {});
    });
  }

  getCurrentAppTheme() async {
    darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(isdarkMode, context),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
