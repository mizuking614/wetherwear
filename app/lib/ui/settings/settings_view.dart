import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_config.dart';
import '../../ui/settings/settings_view_model.dart';
import '../../utils/color.dart';

import 'components/link_card.dart';
import 'components/profile_card.dart';
import 'components/save_button.dart';
import 'components/schedule_card.dart';
import 'components/sense_card.dart';
import 'components/toggle_card.dart';

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
                        color: AppColors.accentBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'あなただけの服装アドバイスにカスタマイズ',
                      style: TextStyle(fontSize: 23, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ー 基本設定 ー
                  const ProfileCard(),
                  const SizedBox(height: 16),

                  // － 体感温度の基本設定 ー
                  SenseCard(
                    current: config.basePreference,
                    onChanged: vm.setBasePreference, //変更を反映
                  ),
                  const SizedBox(height: 16),

                  // － コンディション設定 ー
                  ToggleCard(
                    title: '💊 コンディション設定',
                    rows: [
                      ToggleRow(
                        iconEmoji: '🌸',
                        iconColor: AppColors.accentGreen.withValues(alpha: 0.14),
                        label: '花粉症モード',
                        desc: '花粉症の多い日にマスク・眼鏡を提案',
                        value: config.hasPollenAllergy,
                        onChanged: vm.setPollenAllergy,
                      ),
                      ToggleRow(
                        iconEmoji: '🌂',
                        iconColor: AppColors.accentWarn.withValues(alpha: 0.14),
                        label: '冷え込みアラート',
                        desc: '帰宅時の気温差が大きい場合に通知',
                        value: config.coldAlertEnabled,
                        onChanged: vm.setColdAlert,
                      ),
                      ToggleRow(
                        iconEmoji: '🧘',
                        iconColor: AppColors.accentBlue.withValues(alpha: 0.14),
                        label: '体調補正モード',
                        desc: '体調が悪い日は厚着を推奨',
                        value: config.healthCorrectionEnabled,
                        onChanged: vm.setHealthCorrection,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // － 行動スケジュール ー
                  ScheduleCard(config: config, vm: vm),
                  const SizedBox(height: 16),

                  // － その他・データ ー
                  LinkCard(vm: vm),
                  const SizedBox(height: 20),

                  // － 保存ボタン ー
                  SaveButton(
                    onTap: () {
                      vm.save(); //保存メソッド呼び出し
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('設定を保存しました'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.accentBlue,
                          duration: const Duration(seconds: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ), //保存完了の通知
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  // ー バージョン ー
                  const Center(
                    child: Text(
                      'WeTheWear v0.1.0',
                      style: TextStyle(fontSize: 11, color: AppColors.textMuted),
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
