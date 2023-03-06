import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/extensions/extensions.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/theme/actions.dart';

class LaunchDetailPage extends StatelessWidget {
  const LaunchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.from,
      builder: (_, viewModel) {
        return Scaffold(
          backgroundColor: context.primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: viewModel.onDarkModePressed,
                  color: context.secondaryColor,
                  icon: const Icon(Icons.nights_stay),
                ),
                IconButton(
                  onPressed: viewModel.onLightModePressed,
                  icon: const Icon(Icons.sunny),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

@immutable
class _ViewModel extends Equatable {
  const _ViewModel._({required this.onDispatch});

  factory _ViewModel.from(final Store<AppState> store) {
    return _ViewModel._(onDispatch: store.dispatch);
  }

  final void Function(dynamic) onDispatch;

  void onDarkModePressed() =>
      onDispatch(const SwitchThemeAction(AppThemeMode.dark));

  void onLightModePressed() =>
      onDispatch(const SwitchThemeAction(AppThemeMode.light));

  @override
  List<Object> get props => [];
}
