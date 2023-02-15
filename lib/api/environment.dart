enum Environment {
  staging,
  production,
  testing;

  bool get isProductionEnv =>
      _domain(productionDomain: 'p', testingDomain: 't') == 'p';

  String _domain({
    required String productionDomain,
    required String testingDomain,
  }) {
    switch (this) {
      case Environment.production:
        return productionDomain;
      case Environment.staging:
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
}
