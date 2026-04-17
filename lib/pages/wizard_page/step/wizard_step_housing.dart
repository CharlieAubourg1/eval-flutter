import 'package:flutter/material.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_transports.dart';
import 'package:green_track/res/app_colors.dart';

/// Widgets à utiliser :
/// - [FilledButton]
/// - [TextField]
/// - [RadioGroup] avec [Radio] (regarder la doc de [RadioListTile])
class WizardStepTransports extends StatelessWidget {
  const WizardStepTransports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GreenTrackHeader(),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Text(
              'Logement principal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CarSection(),
                  SizedBox(height: 16),
                  BikeSection(),
                ],
              ),
            ),
          ),

          const WizardFooter(),
        ],
      ),
    );
  }
}

class _GreenTrackHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.secondary,
      padding: const EdgeInsets.fromLTRB(16, 52, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ÉTAPE 2 SUR 3',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
              color: AppColors.primaryDark,
            ),
          ),

          const SizedBox(height: 6),

          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 1 / 3,
              minHeight: 6,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}

class WizardFooter extends StatelessWidget {
  const WizardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color.fromRGBO(198, 238, 180, 1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Annuler",
                style: TextStyle(
                  color: Color.fromRGBO(56, 89, 45, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(34, 64, 25, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Continuer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
