import 'package:flutter/material.dart';
import '../../settings/settings_view_model.dart';
import '../../../utils/color.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({super.key, required this.vm});
  final SettingsViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: ListTile(
        title: const Text(
          'リセット',
          style: TextStyle(fontSize: 14, color: Colors.redAccent),
        ),
        leading: const Icon(Icons.refresh, color: Colors.redAccent),
        onTap: vm.resetConfig,
      ),
    );
  }
}
