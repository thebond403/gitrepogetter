enum EnvironmentType { dev, production }
class EnvironmentConfig {
  static EnvironmentType _environment = EnvironmentType.dev;
  static const String _devBaseURL = "https://api.github.com";
  static const String _productionBaseURL = "https://api.github.com";
  static const String _accessToken = "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";

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
