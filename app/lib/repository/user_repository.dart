import '../data/models/user_config.dart';
import '../data/models/feedback_record.dart';

abstract class UserRepository {
  UserConfig loadConfig();
  Future<void> saveConfig(UserConfig config);
  List<FeedbackRecord> loadFeedbackRecords();
  Future<void> saveFeedbackRecord(FeedbackRecord record);
}
