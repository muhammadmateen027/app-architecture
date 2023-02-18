import 'package:flutter/material.dart';

class SnapshotWidgetSwitcher<T> extends StatelessWidget {
  const SnapshotWidgetSwitcher({
    required this.snapshot,
    required this.child,
    required this.errorChild,
    required this.loadingChild,
    super.key,
  });

  final Widget child;
  final Widget errorChild;
  final Widget loadingChild;
  final AsyncSnapshot<T> snapshot;

  @override
  Widget build(final BuildContext context) {
    return AnimatedSwitcher(
      key: const Key('snapshot_animated_switcher'),
      duration: const Duration(milliseconds: 200),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (snapshot.hasData) {
      return child;
    } else if (snapshot.hasError) {
      return errorChild;
    }
    return loadingChild;
  }
}
