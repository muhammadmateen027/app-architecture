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

extension EnvironmentExt on Environment {
  String get domain {
    return _domain(
      productionDomain: 'api.spacexdata.com',
      testingDomain: 'api.spacexdata.com',
    );
  }

  String get gamesDomain {
    return _domain(
      productionDomain: 'api.spacexdata.com',
      testingDomain: 'api.spacexdata.com',
    );
  }
}
