import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/res/app_colors.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: GreenTrackAppBar(),
      body: Column(
        children: [
          Text(
            localizations.section_results,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
