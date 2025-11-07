import 'package:chefonline/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class PreferenceCard extends StatelessWidget {
  final String title;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final Color? borderColor;
  final Color? activeColor;

  const PreferenceCard({
    super.key,
    required this.title,
    required this.groupValue,
    required this.onChanged,
    this.borderColor,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade300,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: "Yes",
                  groupValue: groupValue,
                  onChanged: onChanged,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Yes",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  activeColor: activeColor ?? theme.colorScheme.primary,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  value: "No",
                  groupValue: groupValue,
                  onChanged: onChanged,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "No",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  activeColor: activeColor ?? theme.colorScheme.primary,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
