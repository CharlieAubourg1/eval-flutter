import 'package:green_track/res/carbonprint_calculation.dart';

class WizardData {
  const WizardData({
    this.carKm = 0,
    this.carPassengers = 1,
    this.bikeKm = 0,
    this.bikeIsElectric = false,
    this.surface = 0,
    this.housingType = HousingType.apartment,
    this.heatingSource = HeatingSource.electricity,
    this.buyNew = false,
  });

  final double carKm;
  final int carPassengers;
  final double bikeKm;
  final bool bikeIsElectric;

  final double surface;
  final HousingType housingType;
  final HeatingSource heatingSource;

  final bool buyNew;
}
