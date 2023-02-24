// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../pages/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SpaceXLaunches.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SpaceXLaunches(),
      );
    },
    LaunchDetailRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LaunchDetailPage(),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          SpaceXLaunches.name,
          path: '/',
        ),
        _i2.RouteConfig(
          LaunchDetailRoute.name,
          path: '/details',
        ),
      ];
}

/// generated route for
/// [_i1.SpaceXLaunches]
class SpaceXLaunches extends _i2.PageRouteInfo<void> {
  const SpaceXLaunches()
      : super(
          SpaceXLaunches.name,
          path: '/',
        );

  static const String name = 'SpaceXLaunches';
}

/// generated route for
/// [_i1.LaunchDetailPage]
class LaunchDetailRoute extends _i2.PageRouteInfo<void> {
  const LaunchDetailRoute()
      : super(
          LaunchDetailRoute.name,
          path: '/details',
        );

  static const String name = 'LaunchDetailRoute';
}
