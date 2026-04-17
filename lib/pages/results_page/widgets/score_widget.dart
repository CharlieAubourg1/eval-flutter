import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/res/app_colors.dart';

enum ScoreLevel { excellent, bon, mediocre, mauvais, execrable }

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key, required this.value});

  final double value;

  ScoreLevel get _level {
    if (value < 0.5) return ScoreLevel.excellent;
    if (value < 1.5) return ScoreLevel.bon;
    if (value < 3.0) return ScoreLevel.mediocre;
    if (value < 8.0) return ScoreLevel.mauvais;
    return ScoreLevel.execrable;
  }

  Color get _backgroundColor {
    switch (_level) {
      case ScoreLevel.excellent:
        return AppColors.scoreExcellentBackground;
      case ScoreLevel.bon:
        return AppColors.scoreGoodBackground;
      case ScoreLevel.mediocre:
        return AppColors.scoreFairBackground;
      case ScoreLevel.mauvais:
        return AppColors.scorePoorBackground;
      case ScoreLevel.execrable:
        return AppColors.scoreVeryPoorBackground;
    }
  }

  Color get _borderColor {
    switch (_level) {
      case ScoreLevel.excellent:
        return AppColors.scoreExcellentBorder;
      case ScoreLevel.bon:
        return AppColors.scoreGoodBorder;
      case ScoreLevel.mediocre:
        return AppColors.scoreFairBorder;
      case ScoreLevel.mauvais:
        return AppColors.scorePoorBorder;
      case ScoreLevel.execrable:
        return AppColors.scoreVeryPoorBorder;
    }
  }

  String _getLabel(AppLocalizations localizations) {
    switch (_level) {
      case ScoreLevel.excellent:
        return localizations.score_label_excellent;
      case ScoreLevel.bon:
        return localizations.score_label_good;
      case ScoreLevel.mediocre:
        return localizations.score_label_fair;
      case ScoreLevel.mauvais:
        return localizations.score_label_poor;
      case ScoreLevel.execrable:
        return localizations.score_label_very_poor;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return CustomPaint(
      painter: _OrganicShapePainter(
        color: _backgroundColor,
        borderColor: _borderColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
                height: 1.0,
              ),
            ),
            Text(
              localizations.score_unit,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _getLabel(localizations),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrganicShapePainter extends CustomPainter {
  const _OrganicShapePainter({required this.color, required this.borderColor});

  final Color color;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final Paint paint = Paint()..color = color;
    final RRect rRect = RRect.fromLTRBAndCorners(
      0,
      0,
      w,
      h,
      topLeft: Radius.elliptical(w * 0.60, h * 0.30),
      topRight: Radius.elliptical(w * 0.40, h * 0.67),
      bottomRight: Radius.elliptical(w * 0.70, h * 0.33),
      bottomLeft: Radius.elliptical(w * 0.30, h * 0.70),
    );
    canvas.drawRRect(rRect, paint);
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRRect(rRect, borderPaint);
  }

  @override
  bool shouldRepaint(_OrganicShapePainter old) =>
      old.color != color || old.borderColor != borderColor;
}
