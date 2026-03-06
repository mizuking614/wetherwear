import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/feedback_record.dart';
import '../../ui/history/history_provider.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(historyProvider);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(floating: true, title: Text('履歴')),
          if (records.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('📋', style: TextStyle(fontSize: 48)),
                    SizedBox(height: 8),
                    Text('まだ記録がありません'),
                  ],
                ),
              ),
            )
          else ...[
            // サマリー統計
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(child: _SummaryRow(records: records)),
            ),
            // 月別リスト
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  _buildMonthlyList(context, records),
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildMonthlyList(
    BuildContext context,
    List<FeedbackRecord> records,
  ) {
    final byMonth = <String, List<FeedbackRecord>>{};
    for (final r in records) {
      final key = '${r.date.year}年 ${r.date.month}月';
      byMonth.putIfAbsent(key, () => []).add(r);
    }

    final widgets = <Widget>[];
    for (final entry in byMonth.entries) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            children: [
              Text(
                entry.key,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 8),
              Expanded(child: Divider()),
              const SizedBox(width: 8),
              Text(
                '${entry.value.length}件',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );
      widgets.add(
        Card(
          child: Column(
            children: entry.value.asMap().entries.map((e) {
              final isLast = e.key == entry.value.length - 1;
              return Column(
                children: [
                  _HistoryItem(record: e.value),
                  if (!isLast) const Divider(height: 1, indent: 16),
                ],
              );
            }).toList(),
          ),
        ),
      );
    }
    return widgets;
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.records});
  final List<FeedbackRecord> records;

  @override
  Widget build(BuildContext context) {
    final total = records.length;
    final justRight = records.where(
      (r) => r.feedback == FeedbackType.justRight,
    );
    final accuracy = total > 0
        ? (justRight.length / total * 100).round()
        : 0;

    return Row(
      children: [
        _SummaryCard('📅', '$total', '記録日数'),
        const SizedBox(width: 10),
        _SummaryCard('🎯', '$accuracy%', 'Gemini的中率', highlight: true),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard(this.icon, this.value, this.label, {this.highlight = false});
  final String icon, value, label;
  final bool highlight;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        color: highlight ? cs.primaryContainer : null,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: highlight ? cs.onPrimaryContainer : null,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: highlight ? cs.onPrimaryContainer : cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.record});
  final FeedbackRecord record;

  Color _stripeColor(FeedbackType type, ColorScheme cs) {
    switch (type) {
      case FeedbackType.justRight:
        return cs.primary;
      case FeedbackType.tooHot:
        return Colors.orange;
      case FeedbackType.tooCold:
        return Colors.indigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        // 左カラー帯
        Container(
          width: 4,
          height: 72,
          decoration: BoxDecoration(
            color: _stripeColor(record.feedback, cs),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // 日付バッジ
        Column(
          children: [
            Text(
              _monthAbbr(record.date.month),
              style: TextStyle(
                fontSize: 9,
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${record.date.day}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        // メイン情報
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                record.outfitAdvice.length > 35
                    ? '${record.outfitAdvice.substring(0, 35)}…'
                    : record.outfitAdvice,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 3),
              Text(
                '🌡️ ${record.temperature.toStringAsFixed(1)}°C / 体感 ${record.apparentTemp.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ),
        // フィードバック絵文字
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            record.feedback.emoji,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }

  String _monthAbbr(int month) {
    const abbrs = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
    ];
    return abbrs[month - 1];
  }
}
