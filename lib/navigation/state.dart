import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stars/navigation/paths.dart';

@immutable
class NavigationState {
  const NavigationState({
    required this.pageStack,
    required this.isOverlayActive,
  });

  NavigationState.initialState()
      : pageStack = Queue<PageRoutePath>(),
        isOverlayActive = false;

  final Queue<PageRoutePath> pageStack;
  final bool isOverlayActive;

  NavigationState copyWith({
    final Queue<PageRoutePath>? pageStack,
    final bool isOverlayActive = false,
  }) {
    return NavigationState(
      pageStack: pageStack ?? this.pageStack,
      isOverlayActive: isOverlayActive,
    );
  }
}
