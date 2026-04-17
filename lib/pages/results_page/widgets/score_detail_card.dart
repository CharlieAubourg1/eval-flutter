import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/res/app_colors.dart';

class ScoreDetailCard extends StatelessWidget {
  const ScoreDetailCard({required this.details});

  final List<({String label, IconData icon, double value, double max})> details;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.score_details_title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 16),
          ...details.map(
            (d) => _ScoreDetailRow(
              icon: d.icon,
              label: d.label,
              value: d.value,
              max: d.max,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreDetailRow extends StatelessWidget {
  const _ScoreDetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.max,
  });

  final IconData icon;
  final String label;
  final double value;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryDark, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '${value}t',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value / max,
              minHeight: 6,
              backgroundColor: AppColors.primary.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
