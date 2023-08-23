enum Flavor {
  local,
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'rio_sport Local';
      case Flavor.development:
        return 'rio_sport Development';
      case Flavor.production:
        return 'rio_sport Production';
      default:
        return 'title';
    }
  }

  /// Defines the environment variables filename for each flavor
  static String get envFileName => '${appFlavor?.name}.config.json';
}
