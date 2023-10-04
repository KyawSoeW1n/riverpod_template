enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Riverpod Dev';
      case Flavor.production:
        return 'Riverpod';
      default:
        return 'title';
    }
  }

  static String get envFileName => '${appFlavor?.name}.config.json';
}
