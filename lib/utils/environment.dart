enum Environment {
  staging,
  production,

  /// Predefined set of API responses
  stub,

  /// Predefined set of API responses form pre-deployed response files
  testing;

  bool get isProductionEnv =>
      _domain(productionDomain: 'p', testingDomain: 't') == 'p';

  bool get isStub => this == Environment.stub;

  String _domain({
    required final String productionDomain,
    required final String testingDomain,
  }) {
    switch (this) {
      case Environment.production:
        return productionDomain;
      case Environment.staging:
      case Environment.stub:
      case Environment.testing:
        return testingDomain;
    }
  }
}

extension EnvironmentX on Environment {
  String get toLabel {
    switch (this) {
      case Environment.staging:
        return 'staging';
      case Environment.stub:
        return 'stub';
      case Environment.testing:
        return 'dev';
      default:
        return '';
    }
  }
}
