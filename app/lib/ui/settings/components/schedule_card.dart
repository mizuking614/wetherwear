import 'package:flutter/material.dart';
import '../../../data/models/user_config.dart';
import '../../settings/settings_view_model.dart';
import '../../../utils/color.dart';
import 'section_title.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.config, required this.vm});
  final UserConfig config;
  final SettingsViewModel vm;

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
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: SectionTitle(icon: '🕑', label: '行動スケジュール'),
          ),
          const Divider(height: 1, color: AppColors.borderColor),
          ScheduleRow(
            dotColor: AppColors.accentWarn,
            label: '🌅 出発時刻',
            initial: TimeOfDay(
              hour: config.departureHour,
              minute: config.departureMinute,
            ),
            onChanged: (t) => vm.setDepartureTime(t.hour, t.minute),
          ),
          ScheduleRow(
            dotColor: AppColors.accentBlue,
            label: '🌞 昼休み',
            initial: TimeOfDay(
              hour: config.lunchHour,
              minute: config.lunchMinute,
            ),
            onChanged: (t) => vm.setLunchTime(t.hour, t.minute),
          ),
          ScheduleRow(
            dotColor: AppColors.accentWarn,
            label: '🌃 帰宅時刻',
            initial: TimeOfDay(
              hour: config.returnHour,
              minute: config.returnMinute,
            ),
            onChanged: (t) => vm.setReturnTime(t.hour, t.minute),
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class ScheduleRow extends StatefulWidget {
  const ScheduleRow({
    super.key,
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
  State<ScheduleRow> createState() => _ScheduleRowState();
}

class _ScheduleRowState extends State<ScheduleRow> {
  late TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _time = widget.initial;
  }

  @override
  void didUpdateWidget(ScheduleRow oldWidget) {
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
            primary: AppColors.accentBlue,
            surface: AppColors.bgCard,
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
    final label =
        _time.hour.toString().padLeft(2, '0') +
        ':' +
        _time.minute.toString().padLeft(2, '0');
    return Container(
      decoration: widget.isLast
          ? null
          : const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.borderColor)),
            ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.dotColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ),
          GestureDetector(
            onTap: _pick,
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.bgCard2,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor),
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
