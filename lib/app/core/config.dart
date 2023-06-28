enum Flavor {
  development,
  production,
}

class Config {
  static Flavor appFlavor = Flavor.development;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://api.themoviedb.org/3/';
      case Flavor.production:
        return 'https://api.themoviedb.org/3/';
    }
  }

  static bool get debugShowCheckedModeBanner {
    switch (appFlavor) {
      case Flavor.development:
        return true;
      case Flavor.production:
        return false;
    }
  }
}
