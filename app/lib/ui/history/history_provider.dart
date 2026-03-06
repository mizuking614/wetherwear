import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/feedback_record.dart';
import '../../providers.dart';

final historyProvider = Provider<List<FeedbackRecord>>((ref) {
  final repo = ref.read(userRepositoryProvider);
  return repo.loadFeedbackRecords();
});
