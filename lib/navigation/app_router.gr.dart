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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../counter/view/counter_page.dart' as _i2;
import '../spacex/spacex.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SpaceXLaunches.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SpaceXLaunches(),
      );
    },
    CounterDetail.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CounterDetail(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          SpaceXLaunches.name,
          path: '/',
        ),
        _i3.RouteConfig(
          CounterDetail.name,
          path: '/details',
        ),
      ];
}

/// generated route for
/// [_i1.SpaceXLaunches]
class SpaceXLaunches extends _i3.PageRouteInfo<void> {
  const SpaceXLaunches()
      : super(
          SpaceXLaunches.name,
          path: '/',
        );

  static const String name = 'SpaceXLaunches';
}

/// generated route for
/// [_i2.CounterDetail]
class CounterDetail extends _i3.PageRouteInfo<void> {
  const CounterDetail()
      : super(
          CounterDetail.name,
          path: '/details',
        );

  static const String name = 'CounterDetail';
}
