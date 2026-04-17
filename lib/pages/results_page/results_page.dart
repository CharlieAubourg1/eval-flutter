import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/pages/results_page/widgets/score_widget.dart';
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
          ScoreWidget(value: 15.1),
        ],
      ),
    );
  }
}

// enum ScoreLevel { excellent, bon, mediocre, mauvais, execrable }

// ScoreLevel _getScoreLevel(double value) {
//   if (value < 1.0) return ScoreLevel.excellent;
//   if (value < 3.0) return ScoreLevel.bon;
//   if (value < 5.0) return ScoreLevel.mediocre;
//   if (value < 8.0) return ScoreLevel.mauvais;
//   return ScoreLevel.execrable;
// }

// class _ResultIcon extends StatelessWidget {
//   const _ResultIcon({required this.value});

//   final double value;

//   ScoreLevel get _level {
//     if (value < 1.0) return ScoreLevel.excellent;
//     if (value < 3.0) return ScoreLevel.bon;
//     if (value < 5.0) return ScoreLevel.mediocre;
//     if (value < 8.0) return ScoreLevel.mauvais;
//     return ScoreLevel.execrable;
//   }

//   Color get _backgroundColor {
//     switch (_level) {
//       case ScoreLevel.excellent:
//         return AppColors.scoreExcellentBackground;
//       case ScoreLevel.bon:
//         return AppColors.scoreGoodBackground;
//       case ScoreLevel.mediocre:
//         return AppColors.scoreFairBackground;
//       case ScoreLevel.mauvais:
//         return AppColors.scorePoorBackground;
//       case ScoreLevel.execrable:
//         return AppColors.scoreVeryPoorBackground;
//     }
//   }

//   String _getLabel(AppLocalizations localizations) {
//     switch (_level) {
//       case ScoreLevel.excellent:
//         return localizations.score_label_excellent;
//       case ScoreLevel.bon:
//         return localizations.score_label_good;
//       case ScoreLevel.mediocre:
//         return localizations.score_label_fair;
//       case ScoreLevel.mauvais:
//         return localizations.score_label_poor;
//       case ScoreLevel.execrable:
//         return localizations.score_label_very_poor;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     AppLocalizations localizations = AppLocalizations.of(context)!;
//     return Container(
//       width: 160,
//       height: 160,
//       decoration: BoxDecoration(
//         color: _backgroundColor,
//         borderRadius: BorderRadius.circular(48),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             value.toString(),
//             style: const TextStyle(
//               fontSize: 50,
//               fontWeight: FontWeight.w900,
//               color: AppColors.primaryDark,
//               height: 1.0,
//             ),
//           ),
//           Text(
//             localizations.score_unit,
//             style: const TextStyle(
//               fontSize: 12,
//               color: AppColors.primary,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               _getLabel(localizations),
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.primary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
