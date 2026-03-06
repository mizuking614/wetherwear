import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_config.dart';
import '../../ui/settings/settings_view_model.dart';

// ー カラー定数(デザインに合わせたダークテーマ) ー
const _bgCard = Color(0xFF1a1d27);
const _bgCard2 = Color(0xFF20243a);
const _accentBlue = Color(0xFF4f8ef7);
const _accentCyan = Color(0xFF38d9c0);
const _accentGreen = Color(0xFF4ecb71);
const _accentWarn = Color(0xFFf7a23e);
const _accentRed = Color(0xFFf76f6f);
const _textSecondary = Color(0xFF8b93b8);
const _textMuted = Color(0xFF555e80);
const _borderColor = Color(0x12FFFFFF);

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsViewModelProvider); //現在の設定を見張る
    final vm = ref.read(settingsViewModelProvider.notifier); //ViewModelを操作する
    
    return Container(
      color: const Color(0xFF0f1117),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ー ヘッダー ー
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚙️設定',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _accentBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'あなただけの服装アドバイスにカスタマイズ',
                      style: TextStyle(fontSize: 23, color: _textSecondary),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32)
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ー 基本設定 ー
                  _ProfikeCard(),
                  const SizedBox(height: 16),

                  // － 体感温度の基本設定 ー
                  _SenseCard(
                    current: config.basePreference,
                    onChanged: vm.setBasePreference, //変更を反映
                  ),
                  const SizedBox(height: 16),
                  
                  // － コンディション設定 ー
                  _ToggleCard(
                    title: '💊 コンディション設定',
                    rows: [
                      _ToggleRow(
                        iconEmoji: '🌸',
                        iconColor: _accentGreen.overrideWithValues(alpha: 0.14),
                        label: '花粉症モード',
                        desc: '花粉症の多い日にマスク・眼鏡を提案',
                        value: config.hasPollenAllergy,
                        onChanged: vm.setPollenAllergy,
                      ),
                      _ToggleRow(
                        iconEmoji: '🌂',
                        iconColor: _ntWarn.withValues(alpha: 0.14),
                        label: '冷え込みアラート',
                        desc: '帰宅時の気温差が大きい場合に通知',
                        value: config.coldAlertEnabled,
                        onChanged: vm.setColdAlert,
                      ),
                      _ToggleRow(
                        iconEmoji: '🧘',
                        iconColor: _accentBlue.withValues(alpha: 0.14),
                        label: '体調補正モード',
                        desc: '体調が悪い日は厚着を推奨',
                        value: config.healthCorrectionEnabled,
                        onChanged: vm.setHealthCorrection,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // － 行動スケジュール ー
                  _ScheduleCard(config: config, vm: vm),
                  const SizedBox(height: 16),

                  // － その他・データ ー
                  _LinkCard(vm: vm),
                  const SizedBox(height: 20),

                  // － 保存ボタン ー
                  _SaveButton(onTap: () {
                    vm.save(); //保存メソッド呼び出し
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: constText('設定を保存しました'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: _accentBlue,
                        duration: Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      ), //保存完了の通知
                    );
                  }),
                  const SizedBox(height: 12),

                  // ー バージョン ー
                  Center(
                    child: Text(
                      'WeTheWear v0.1.0',
                      style: TextStyle(fontSize: 11, color: _textMuted),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// == プロフィールカード ==
class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ), //デザイン
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_accentBlue, _accentCyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text('👨', style: TextStyle(fontSize: 26)),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                    'マイプロフィール',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 4),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: _accentBlue.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _accentBlue.withValues(alpha: 0.3)),
                ),
                child: const Text(
                  '✦ パーソナライズ済み',
                  style: TextStyle(
                    fontSize: 11,
                    color: _accentBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// == 体感セレクター ==
class _SenseCard extends StatelessWidget {
  const _SenseCard({required this.current, required this.onChanged});
  final BodyPreference current;
  final ValueChanged<BodyPreference> onChanged;

  static const _items = [
    (BodyPreference.hot, '🥵', '暑がり'),
    (BodyPreference.nomal, '😊', '標準'),
    (BodyPreference.cold, '🥶', '寒がり'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: boxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: '🌡️', label: '体感温度の基本設定'),
          const SizedBox(height: 14),
          Row(
            children: _items.map((item) {
              final (pref, emoji, label) = item;
              final isSelected = current == pref;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(pref),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horisontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [
                                Color(0x2E4F8EF7),
                                Color(0x1938D9C0),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isSelected ? null : _bgCard2,
                      border: Border.all(
                        color: isSelected ? _accentBlue : _borderColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Text(emoji,
                            style: const TextStyle(fontSize: 26)),
                        const SizedBox(height: 7),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 13,
                            color:
                                isSelected ? Colors.white : _textMuted,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedOpacity(
                          opacity: isSelected ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: const Text(
                            '✓ 選択中',
                            style:
                                TextStyle(fontSize: 10, color: _accentCyan, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// == トグルカード ==
class _ToggleCard extends StatelessWidget {
  const _ToggleCard({required this.title, required this.rows});
  final String title;
  final List<_ToggleRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(
            padding: const EdgeInsets.fromLTRB(220,16, 20, 12),
            child: _SectionTitle(title),
          ),
          const Divider(height: 1, color: _borderColor),
          ...rows.map((row) => row),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.iconEmoji,
    required this.iconColor,
    required this.label,
    required this.desc,
    required this.value,
    required this.onChanged,
  });
  final String iconEmoji;
  final Color iconColor;
  final String label;
  final String desc;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _borderColor)),
      ),
      child: SwitchListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        secondary: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(iconEmoji, style: TextStyle(fontSize: 18))),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(fontSize: 12, color: _textMuted, fontSize: 11),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: _accentCyan,
        activeTrackColor: _accentBlue.withValues(alpha: 0.5),
        inactiveThumbColor: const Color(0xFF4a4f6a),
        inactiveTrackColor: const Color(0xFF2a2e42),
      ),
    );
  }
}

// == スケジュールカード ==
class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({required this.config, required this.vm});
  final UserConfig config;
  final SettingsViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: _SectionTitle('🕑 行動スケジュール'),
          ),
          const Divider(height: 1, color: _borderColor),
          _ScheduleRow(
            dotColor: _accentWarn,
            label: '🌅 出発時刻',
            initial: TimeOfDay(
              hour: config.departureHour,
              minute: config.departureMinute),
            onChanged: (t) => vm.setDepartureTime(t.hour, t.minute),      
          ),
          _ScheduleRow(
            dotColor: _accentBlue,
            label: '🌞 昼休み',
            initial:
                TimeOfDay(hour: config.lunchHour, minute: config.lunchMinute),
            onChanged: (t) => vm.setLunchTime(t.hour, t.minute),
          ),
          _ScheduleRow(
            dotColor: _accentWarn,
            label: '🌃 帰宅時刻',
            initial: TimeOfDay(
                hour: config.returnHour, minute: config.returnMinute),
            onChanged: (t) => vm.setReturnTime(t.hour, t.minute),
          ),
        ],
      ),
    );
  }
}


class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({
    required this.dotColor, 
    required this.label, 
    required this.initial, 
    required this.onChanged,
    this.isLast = false,
  });
  final Color dotColor;
  final String label;
  final TimeOfDay initial;
  final ValueChanged<TimeOfDay> onChanged;
  final bool isLast;

  @override
  State<_ScheduleRow> createState() => _ScheduleRowState();
}

class _ScheduleRowState extends State<_ScheduleRow> {
  late TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _time = widget.initial;
  }

  @override
  void didUpdateWidget(_ScheduleRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initial != widget.initial) {
      _time = widget.initial;
    }
  }

  Future<void> _pick() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: _accentBlue,
            surface: _bgCard,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => _time = picked);
      widget.onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = _tome.hour.toString().padLeft(2, '0') +
        ':' +
        _time.minute.toString().padLeft(2, '0');
    return Container(
      decoration: widget.isLast
          ? null
          : const BoxDecoration(
            border: Border(bottom: BorderSide(color: _borderColor))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.dotColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 13, color: _textSecondary),
            ),
          ),
          GestureDetector(
            onTap: _pick,
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _bgCard2,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _borderColor),
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// == リンクカード ==
class _LinkCard extends StatelessWidget {
  const _LinkCard({required this.vm});
  final String iconEmoji;

}
