import 'package:provider_test/data/network/networkapiservices.dart';
import 'package:provider_test/resource/app_url.dart';

class AuthRepository {
  final NetworkApiServices apiService;

  AuthRepository({required this.apiService});

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrl.loginurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrl.registerurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
