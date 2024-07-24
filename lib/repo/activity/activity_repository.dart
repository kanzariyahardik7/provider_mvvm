import 'package:provider_test/models/activity_model.dart';

abstract class ActivityRepository {
  Future<ActivityModel> fetchActivity();
  Future<void> deleteActivity(data);
}
