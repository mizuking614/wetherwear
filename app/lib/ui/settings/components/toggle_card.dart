import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import 'section_title.dart';

class ToggleCard extends StatelessWidget {
  const ToggleCard({super.key, required this.title, required this.rows});
  final String title;
  final List<ToggleRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: SectionTitle(icon: '💊', label: title),
          ),
          const Divider(height: 1, color: AppColors.borderColor),
          ...rows,
        ],
      ),
    );
  }
}

class ToggleRow extends StatelessWidget {
  const ToggleRow({
    super.key,
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
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        secondary: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(iconEmoji, style: const TextStyle(fontSize: 18))),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.accentCyan,
        activeTrackColor: AppColors.accentBlue.withValues(alpha: 0.5),
        inactiveThumbColor: const Color(0xFF4a4f6a),
        inactiveTrackColor: const Color(0xFF2a2e42),
      ),
    );
  }
}
