import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';

class CompensationCard extends StatelessWidget {
  const CompensationCard({required this.treesCount});

  final int treesCount;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.scoreExcellentBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.score_compensation_title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.score_compensation_label(treesCount),
            style: const TextStyle(fontSize: 13, color: AppColors.primaryDark),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
              treesCount,
              (_) =>
                  Icon(AppIcons.forest, color: AppColors.primaryDark, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
