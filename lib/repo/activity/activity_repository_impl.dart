import 'package:provider_test/data/network/networkapiservices.dart';
import 'package:provider_test/models/activity_model.dart';
import 'package:provider_test/repo/activity/activity_repository.dart';
import 'package:provider_test/resource/app_url.dart';

class ActivityRepositoryImpl extends ActivityRepository {
  final NetworkApiServices apiService;

  ActivityRepositoryImpl({required this.apiService});
  @override
  Future<ActivityModel> fetchActivity() async {
    try {
      dynamic response = await apiService.getGetApiResponse(AppUrl.activity);
      final jsonData = ActivityModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteActivity(data) async {
    try {
      await apiService.getDeleteApiResponse(AppUrl.activityDelete, data);
    } catch (e) {
      rethrow;
    }
  }
}
