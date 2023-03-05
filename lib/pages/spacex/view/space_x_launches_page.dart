import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/navigation/paths.dart';
import 'package:stars/pages/pages.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/redux/data_state.dart';

class SpaceXLaunches extends StatelessWidget {
  const SpaceXLaunches({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.from,
      builder: (final context, final viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SpaceX Launches'),
            actions: [
              IconButton(
                onPressed: viewModel.onRefreshTapped,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: viewModel.dataState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : LaunchesContent(
                  launches: viewModel.launches,
                  onLaunchTapped: (item) => viewModel.onLaunchTapped(context),
                ),
        );
      },
    );
  }
}

@immutable
class _ViewModel extends Equatable {
  const _ViewModel._({
    required this.launches,
    required this.onDispatch,
    required this.dataState,
  });

  factory _ViewModel.from(final Store<AppState> store) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      launches: store.state.spaceXLaunchesState.launches,
      dataState: store.state.spaceXLaunchesState.launchesState,
    );
  }

  final Set<LaunchItem> launches;
  final void Function(dynamic) onDispatch;
  final DataState dataState;

  void onLaunchTapped(final BuildContext context) {
    AutoRouter.of(context).pushNamed(detailPagePath);
  }

  void onRefreshTapped() => onDispatch(const RefreshLaunchesAction());

  @override
  List<Object> get props => [launches, dataState];
}
