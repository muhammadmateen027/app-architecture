enum Environment {
  staging,
  production,
  stub,
  testing;

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

  String get debugLabel {
    switch (this) {
      case Environment.staging:
        return 'staging';
      case Environment.stub:
        return 'stub';
      case Environment.testing:
        return 'test';
      default:
        return '';
    }
  }
}
