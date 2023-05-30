enum PopupStatus {
  show,
  closeByButton,
  closeByBarrier;

  bool get isClosedByBarrier => this == PopupStatus.closeByBarrier;

  bool get isVisible => this == PopupStatus.show;

  bool get isClosedByButton => this == PopupStatus.closeByButton;
}
