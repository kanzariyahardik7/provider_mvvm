import 'package:flutter/material.dart';
import 'package:provider_test/data/response/api_response.dart';
import 'package:provider_test/data/response/status.dart';
import 'package:provider_test/models/activity_model.dart';
import 'package:provider_test/repo/activity/activity_repository_impl.dart';

class ActivityViewModel extends ChangeNotifier {
  final ActivityRepositoryImpl homeRepo;
  ActivityViewModel({required this.homeRepo});

  List<Datum> activityList = [];

  ApiResponse<ActivityModel> activityResponse = ApiResponse.loading();
  // ApiResponse<Datum> activityDeleteResponse = ApiResponse.loading();

  void setActivity(ApiResponse<ActivityModel> response) {
    activityResponse = response;
    if (activityResponse.status == Status.completed) {
      activityList = activityResponse.data?.data?.data ?? [];
    }
    notifyListeners();
  }

  // void setDeleteActivity(ApiResponse<Datum> responseDelete) {
  //   activityDeleteResponse = responseDelete;
  //   activityList.remove(responseDelete.data);
  //   notifyListeners();
  // }

  Future fetchActivityList() async {
    setActivity(ApiResponse.loading());
    homeRepo
        .fetchActivity()
        .then((value) => setActivity(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setActivity(ApiResponse.error(error.toString())));
  }

  Future deleteActivity(data) async {
    homeRepo.deleteActivity(data);
  }
}
