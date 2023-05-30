import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/redux/app_state.dart';

class AppSnackBar<T> extends StatelessWidget {
  const AppSnackBar({
    required this.builder,
    required this.child,
    this.action,
    super.key,
    // ignore: avoid_field_initializers_in_const_classes
  }) : _screen = T;

  final Widget Function(BuildContext) builder;
  final Widget child;
  final Type _screen;
  final SnackBarAction? action;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.from,
      builder: (final context, final viewModel) => builder(context),
      onWillChange: (final oldViewModel, final viewModel) {
        viewModel.show(context, child, _screen, action: action);
      },
    );
  }
}

@immutable
class _ViewModel {
  const _ViewModel._({
    required this.onDispatch,
    required this.screen,
    required this.status,
  });

  factory _ViewModel.from(final Store<AppState> store) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      screen: store.state.snackBarState.screen,
      status: store.state.snackBarState.status,
    );
  }

  final Type? screen;
  final PopupStatus status;

  final void Function(dynamic) onDispatch;

  void show(
    BuildContext context,
    Widget child,
    final Type screen, {
    SnackBarAction? action,
  }) {
    if (_snackBarVisible && screen == this.screen) {
      final snackBar = SnackBar(
        content: child,
        action: action,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      onDispatch(const HideSnackBarAction());
    }
  }

  bool get _snackBarVisible => status == PopupStatus.show;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          screen == other.screen &&
          status == other.status;

  @override
  int get hashCode => screen.hashCode ^ status.hashCode;
}
