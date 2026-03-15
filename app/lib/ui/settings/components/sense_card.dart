import 'package:flutter/material.dart';
import '../../../data/models/user_config.dart';
import '../../../utils/color.dart';
import 'section_title.dart';

class SenseCard extends StatelessWidget {
  const SenseCard({super.key, required this.current, required this.onChanged});
  final BodyPreference current;
  final ValueChanged<BodyPreference> onChanged;

  static const _items = [
    (BodyPreference.hot, '🥵', '暑がり'),
    (BodyPreference.normal, '😊', '標準'),
    (BodyPreference.cold, '🥶', '寒がり'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(icon: '🌡️', label: '体感温度の基本設定'),
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
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [Color(0x2E4F8EF7), Color(0x1938D9C0)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isSelected ? null : AppColors.bgCard2,
                      border: Border.all(
                        color: isSelected ? AppColors.accentBlue : AppColors.borderColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Text(emoji, style: const TextStyle(fontSize: 26)),
                        const SizedBox(height: 7),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 13,
                            color: isSelected ? Colors.white : AppColors.textMuted,
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
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.accentCyan,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
