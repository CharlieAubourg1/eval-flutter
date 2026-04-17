class CarbonFootprintCalculator {
  const CarbonFootprintCalculator._();

  static double car(double km, int passengers) {
    return (km * 0.14 + (1 + (passengers - 1) * 0.05)) / passengers;
  }

  static double bike({required bool isElectric, required double km}) {
    return isElectric ? km * 0.0015 : 0;
  }

  static double transports({
    double carKm = 0,
    int carPassengers = 1,
    double bikeKm = 0,
    bool bikeIsElectric = false,
  }) {
    return car(carKm, carPassengers) +
        bike(isElectric: bikeIsElectric, km: bikeKm);
  }

  static double housing({
    required double surface,
    required HousingType type,
    required HeatingSource heating,
  }) {
    return surface * type.coef * heating.coef;
  }

  static double total({
    required double transportScore,
    required double housingScore,
    required bool buyNew,
  }) {
    final double base = transportScore + housingScore;
    return buyNew ? base * 1.3 : base;
  }
}

enum HousingType {
  apartment(coef: 0.8),
  house(coef: 1.2);

  const HousingType({required this.coef});
  final double coef;
}

enum HeatingSource {
  wood(coef: 2),
  electricity(coef: 5),
  gas(coef: 20);

  const HeatingSource({required this.coef});
  final double coef;
}
