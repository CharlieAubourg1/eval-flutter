import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/l10n/app_localizations.dart';

class WizardStepTransports extends StatelessWidget {
  const WizardStepTransports({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GreenTrackHeader(),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Text(
              localizations.score_details_label_transports,
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
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      color: AppColors.secondary,
      padding: const EdgeInsets.fromLTRB(16, 52, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.current_step(1, 3),
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
    AppLocalizations localizations = AppLocalizations.of(context)!;
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
              child: Text(
                localizations.buttons_bar_cancel,
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
              child: Text(
                localizations.buttons_bar_continue,
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

class CarSection extends StatefulWidget {
  const CarSection({super.key});

  @override
  State<CarSection> createState() => _CarSectionState();
}

class _CarSectionState extends State<CarSection> {
  double _kilometers = 12000;
  int _selectedPassengers = 2;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.directions_car,
                    color: AppColors.primaryDark,
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  localizations.transports_car,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localizations.transports_car_km_label),
                Text(
                  localizations.transports_car_km_value(_kilometers.toInt()),
                ),
              ],
            ),

            Slider(
              value: _kilometers,
              min: 0,
              max: 50000,
              divisions: 10,
              activeColor: AppColors.secondary,
              inactiveColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _kilometers = value;
                });
              },
            ),

            const SizedBox(height: 12),

            Text(localizations.transports_car_passengers),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [1, 2, 3, 4, 5].map((number) {
                final selected = _selectedPassengers == number;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPassengers = number;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? AppColors.secondary : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(number == 5 ? "5+" : "$number"),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BikeSection extends StatefulWidget {
  const BikeSection({super.key});

  @override
  State<BikeSection> createState() => _BikeSectionState();
}

class _BikeSectionState extends State<BikeSection> {
  bool isMusculaire = true;
  double kmPerYear = 1000;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.directions_bike,
                    color: AppColors.primaryDark,
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  localizations.transports_bike,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ChoiceChip(
                  label: Text(localizations.transports_bike_type_mechanical),
                  selected: isMusculaire,
                  onSelected: (_) {
                    setState(() {
                      isMusculaire = true;
                    });
                  },
                ),

                const SizedBox(width: 10),

                ChoiceChip(
                  label: Text(localizations.transports_bike_type_electric),
                  selected: !isMusculaire,
                  onSelected: (_) {
                    setState(() {
                      isMusculaire = false;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localizations.transports_car_km_label),
                Text(localizations.transports_bike_km_value(kmPerYear.toInt())),
              ],
            ),

            Slider(
              value: kmPerYear,
              min: 0,
              max: 5000,
              divisions: 10,
              activeColor: AppColors.secondary,
              inactiveColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  kmPerYear = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
