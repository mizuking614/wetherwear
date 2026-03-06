import '../data/models/user_config.dart';
import '../data/models/feedback_record.dart';
import '../data/sources/local_storage_service.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalStorageService _storage;

  UserRepositoryImpl(this._storage);

  @override
  UserConfig loadConfig() => _storage.loadUserConfig();

  @override
  Future<void> saveConfig(UserConfig config) => _storage.saveUserConfig(config);

  @override
  List<FeedbackRecord> loadFeedbackRecords() => _storage.loadFeedbackRecords();

  @override
  Future<void> saveFeedbackRecord(FeedbackRecord record) =>
      _storage.saveFeedbackRecord(record);
}
