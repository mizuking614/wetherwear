import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/feedback_record.dart';
import '../../data/models/weather.dart';
import '../../ui/home/home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).loadWeatherAndAdvice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () =>
            ref.read(homeViewModelProvider.notifier).loadWeatherAndAdvice(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Text('WeTheWear'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () => ref
                      .read(homeViewModelProvider.notifier)
                      .loadWeatherAndAdvice(),
                ),
              ],
            ),
            if (state.isLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state.error != null)
              SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline, size: 48),
                        const SizedBox(height: 12),
                        Text(state.error!, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(homeViewModelProvider.notifier)
                              .loadWeatherAndAdvice(),
                          child: const Text('再試行'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else if (state.weather != null) ...[
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── 天気カード ──
                    _WeatherCard(weather: state.weather!),
                    const SizedBox(height: 16),
                    // ── Geminiアドバイス ──
                    _AdviceCard(advice: state.advice),
                    const SizedBox(height: 16),
                    // ── フィードバック ──
                    _FeedbackSection(),
                    const SizedBox(height: 32),
                  ]),
                ),
              ),
            ] else
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('⬆️', style: TextStyle(fontSize: 48)),
                      const SizedBox(height: 8),
                      const Text('上に引っ張って更新'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ===== 天気カード =====
class _WeatherCard extends StatelessWidget {
  const _WeatherCard({required this.weather});
  final WeatherData weather;

  String _weatherIcon(int code) {
    if (code == 0) return '☀️';
    if (code <= 3) return '⛅';
    if (code <= 67) return '🌧️';
    if (code <= 77) return '❄️';
    if (code <= 99) return '⛈️';
    return '🌡️';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _weatherIcon(weather.weatherCode),
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.currentTemp.toStringAsFixed(1)}°C',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '体感 ${weather.apparentTemp.toStringAsFixed(1)}°C',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MetaPill('💧', '湿度 ${weather.humidity.toStringAsFixed(0)}%'),
                _MetaPill(
                  '💨',
                  '風速 ${weather.windSpeed.toStringAsFixed(1)}m/s',
                ),
                _MetaPill(
                  '🌡️',
                  '寒暖差 ${weather.temperatureRange.toStringAsFixed(1)}°C',
                ),
              ],
            ),
            if (weather.needsColdAlert) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: cs.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: cs.onErrorContainer,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '帰宅時に冷え込みます。上着をお持ちください。',
                        style: TextStyle(
                          color: cs.onErrorContainer,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill(this.icon, this.label);
  final String icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

// ===== Geminiアドバイスカード =====
class _AdviceCard extends StatelessWidget {
  const _AdviceCard({required this.advice});
  final String? advice;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      color: cs.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('🤖', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 6),
                Text(
                  'Gemini からのアドバイス',
                  style: TextStyle(
                    color: cs.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              advice ?? '取得中...',
              style: TextStyle(color: cs.onPrimaryContainer, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== フィードバックセクション =====
class _FeedbackSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> submit(FeedbackType type) async {
      await ref.read(homeViewModelProvider.notifier).submitFeedback(type);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('フィードバックを保存しました ${type.emoji}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '今日の服装はどうでしたか？',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: FeedbackType.values.map((type) {
            return _FeedbackButton(type: type, onTap: () => submit(type));
          }).toList(),
        ),
      ],
    );
  }
}

class _FeedbackButton extends StatelessWidget {
  const _FeedbackButton({required this.type, required this.onTap});
  final FeedbackType type;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(type.emoji, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 4),
            Text(type.label, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
