import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/feedback_record.dart';
import '../../repository/user/repository.dart';

part 'history_provider.g.dart';

@riverpod
List<FeedbackRecord> history(Ref ref) =>
    ref.watch(userRepositoryProvider.notifier).loadFeedbackRecords();
