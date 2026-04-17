import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/pages/results_page/widgets/score_compensation_card.dart';
import 'package:green_track/pages/results_page/widgets/score_detail_card.dart';
import 'package:green_track/pages/results_page/widgets/score_widget.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: GreenTrackAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.section_results,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 24),

            Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: ScoreWidget(value: 10.4),
              ),
            ),

            const SizedBox(height: 32),

            ScoreDetailCard(
              details: [
                (
                  label: localizations.score_details_label_transports,
                  icon: AppIcons.car,
                  value: 0.1,
                  max: 1.0,
                ),
                (
                  label: localizations.score_details_label_housing,
                  icon: AppIcons.house,
                  value: 0.1,
                  max: 1.0,
                ),
                (
                  label: localizations.score_details_label_consumption,
                  icon: AppIcons.shoppingCart,
                  value: 0.2,
                  max: 1.0,
                ),
              ],
            ),
            const SizedBox(height: 16),
            CompensationCard(treesCount: 10),
          ],
        ),
      ),
    );
  }
}
