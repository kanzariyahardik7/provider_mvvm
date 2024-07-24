import 'package:flutter/material.dart';
import 'package:provider_test/repo/auth_repository.dart';
import 'package:provider_test/utils/routes/routes_name.dart';
import 'package:provider_test/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  AuthViewModel({required this.authRepository});

  bool _loading = false;
  bool get laoding => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loadingSingup = false;
  bool get laodingSignUp => _loadingSingup;

  setLoadingSignUp(bool value) {
    _loadingSingup = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    authRepository.loginApi(data).then((value) {
      setLoading(false);
      Utils.toastMessage("Login Sucessfully");
      debugPrint(" value-----?? $value");
      setUserData(value.toString());
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage("$error");
    });
  }

  Future<void> signup(dynamic data, BuildContext context) async {
    setLoadingSignUp(true);
    authRepository.registerApi(data).then((value) {
      setLoadingSignUp(false);
      Utils.toastMessage("Register Sucessfully");
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoadingSignUp(false);
      Utils.toastMessage("$error");
    });
  }

  setUserData(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }
}
