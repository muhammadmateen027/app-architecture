import 'dart:collection';

import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:stars/navigation/actions.dart';
import 'package:stars/navigation/paths.dart';
import 'package:stars/redux/actions.dart';

import 'package:stars/redux/app_state.dart';

part 'navigation_view_model.g.dart';

abstract class NavigationViewModel
    implements Built<NavigationViewModel, NavigationViewModelBuilder> {
  factory NavigationViewModel([
    final void Function(NavigationViewModelBuilder) updates,
  ]) = _$NavigationViewModel;

  factory NavigationViewModel.from(final Store<AppState> store) =>
      NavigationViewModel(
        (final b) => b
          ..onDispatch = store.dispatch
          ..pageStack = store.state.navigationState.pageStack,
      );

  NavigationViewModel._();

  void Function(Action action) get onDispatch;

  Queue<PageRoutePath> get pageStack;

  bool get isOnboarded;

  void onBack() => onDispatch(const PopPageAction());
}
