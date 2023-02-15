import 'package:meta/meta.dart';
import 'package:stars/navigation/paths.dart';
import 'package:stars/redux/actions.dart';

@immutable
class NavigateToPageAction extends Action {
  const NavigateToPageAction(this.page);

  final PageRoutePath page;

  @override
  String toString() {
    return 'NavigateToPageAction{page: $page}';
  }
}

@immutable
class PushAndRemoveUntilAction extends Action {
  const PushAndRemoveUntilAction(this.page);

  final PageRoutePath page;

  @override
  String toString() {
    return 'PushAndRemoveUntilAction{pages: $page}';
  }
}

@immutable
class OverlayAction extends Action {
  const OverlayAction(this.isActive);

  final bool isActive;

  @override
  String toString() {
    return 'OverlayAction{isActive: $isActive}';
  }
}

@immutable
class PopPageAction extends Action {
  const PopPageAction();

  @override
  String toString() {
    return 'PopPageAction{}';
  }
}
