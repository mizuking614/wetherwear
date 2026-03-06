enum FeedbackType { tooHot, justRight, tooCold }

extension FeedbackTypeExt on FeedbackType {
  String get emoji {
    switch (this) {
      case FeedbackType.tooHot:
        return '🥵';
      case FeedbackType.justRight:
        return '👌';
      case FeedbackType.tooCold:
        return '🥶';
    }
  }

  String get label {
    switch (this) {
      case FeedbackType.tooHot:
        return '暑かった';
      case FeedbackType.justRight:
        return 'ちょうど良い';
      case FeedbackType.tooCold:
        return '寒かった';
    }
  }

  String get key => name;

  static FeedbackType fromKey(String key) {
    return FeedbackType.values.firstWhere(
      (e) => e.name == key,
      orElse: () => FeedbackType.justRight,
    );
  }
}

class FeedbackRecord {
  final String id;
  final DateTime date;
  final String outfitAdvice;
  final double temperature;
  final double apparentTemp;
  final FeedbackType feedback;

  const FeedbackRecord({
    required this.id,
    required this.date,
    required this.outfitAdvice,
    required this.temperature,
    required this.apparentTemp,
    required this.feedback,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'outfitAdvice': outfitAdvice,
    'temperature': temperature,
    'apparentTemp': apparentTemp,
    'feedback': feedback.key,
  };

  factory FeedbackRecord.fromJson(Map<String, dynamic> json) => FeedbackRecord(
    id: json['id'] as String,
    date: DateTime.parse(json['date'] as String),
    outfitAdvice: json['outfitAdvice'] as String,
    temperature: (json['temperature'] as num).toDouble(),
    apparentTemp: (json['apparentTemp'] as num).toDouble(),
    feedback: FeedbackTypeExt.fromKey(json['feedback'] as String),
  );
}
