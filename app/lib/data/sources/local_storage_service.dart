import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_config.dart';
import '../models/feedback_record.dart';

class LocalStorageService {
  static const _keyBasePreference = 'base_preference';
  static const _keyHasPollenAllergy = 'has_pollen_allergy';
  static const _keyColdAlertEnabled = 'cold_alert_enabled';
  static const _keyFeedbackRecords = 'feedback_records';

  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  // ===== UserConfig =====

  UserConfig loadUserConfig() {
    return UserConfig(
      basePreference: BodyPreferenceExt.fromKey(
        _prefs.getString(_keyBasePreference) ?? 'normal',
      ),
      hasPollenAllergy: _prefs.getBool(_keyHasPollenAllergy) ?? false,
      coldAlertEnabled: _prefs.getBool(_keyColdAlertEnabled) ?? true,
    );
  }

  Future<void> saveUserConfig(UserConfig config) async {
    await Future.wait([
      _prefs.setString(_keyBasePreference, config.basePreference.key),
      _prefs.setBool(_keyHasPollenAllergy, config.hasPollenAllergy),
      _prefs.setBool(_keyColdAlertEnabled, config.coldAlertEnabled),
    ]);
  }

  // ===== FeedbackRecords =====

  List<FeedbackRecord> loadFeedbackRecords() {
    final raw = _prefs.getString(_keyFeedbackRecords);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => FeedbackRecord.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => b.date.compareTo(a.date));
    } catch (_) {
      return [];
    }
  }

  Future<void> saveFeedbackRecord(FeedbackRecord record) async {
    final records = loadFeedbackRecords();
    // 同日のレコードがあれば上書き
    final idx = records.indexWhere(
      (r) =>
          r.date.year == record.date.year &&
          r.date.month == record.date.month &&
          r.date.day == record.date.day,
    );
    if (idx >= 0) {
      records[idx] = record;
    } else {
      records.insert(0, record);
    }
    await _prefs.setString(
      _keyFeedbackRecords,
      jsonEncode(records.map((r) => r.toJson()).toList()),
    );
  }
}
