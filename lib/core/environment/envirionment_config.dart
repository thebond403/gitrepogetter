enum EnvironmentType { dev, production }
class EnvironmentConfig {
  static EnvironmentType _environment = EnvironmentType.dev;
  static const String _devBaseURL = "https://api.github.com";
  static const String _productionBaseURL = "https://api.github.com";
  static const String _accessToken =
      "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";

  static EnvironmentType get environment => _environment;


  static String get accessToken => _accessToken;

  static String get baseUrl {
    switch (_environment) {
      case EnvironmentType.dev:
        return _devBaseURL;
      case EnvironmentType.production:
        return _productionBaseURL;
    }
  }

  static setupEnvironment(EnvironmentType environment) {
    _environment = environment;
  }
}
