// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NavigationViewModel extends NavigationViewModel {
  @override
  final void Function(Action action) onDispatch;
  @override
  final Queue<PageRoutePath> pageStack;
  @override
  final bool isOnboarded;

  factory _$NavigationViewModel(
          [void Function(NavigationViewModelBuilder)? updates]) =>
      (new NavigationViewModelBuilder()..update(updates))._build();

  _$NavigationViewModel._(
      {required this.onDispatch,
      required this.pageStack,
      required this.isOnboarded})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        onDispatch, r'NavigationViewModel', 'onDispatch');
    BuiltValueNullFieldError.checkNotNull(
        pageStack, r'NavigationViewModel', 'pageStack');
    BuiltValueNullFieldError.checkNotNull(
        isOnboarded, r'NavigationViewModel', 'isOnboarded');
  }

  @override
  NavigationViewModel rebuild(
          void Function(NavigationViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationViewModelBuilder toBuilder() =>
      new NavigationViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is NavigationViewModel &&
        onDispatch == _$dynamicOther.onDispatch &&
        pageStack == other.pageStack &&
        isOnboarded == other.isOnboarded;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, onDispatch.hashCode);
    _$hash = $jc(_$hash, pageStack.hashCode);
    _$hash = $jc(_$hash, isOnboarded.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NavigationViewModel')
          ..add('onDispatch', onDispatch)
          ..add('pageStack', pageStack)
          ..add('isOnboarded', isOnboarded))
        .toString();
  }
}

class NavigationViewModelBuilder
    implements Builder<NavigationViewModel, NavigationViewModelBuilder> {
  _$NavigationViewModel? _$v;

  void Function(Action action)? _onDispatch;
  void Function(Action action)? get onDispatch => _$this._onDispatch;
  set onDispatch(void Function(Action action)? onDispatch) =>
      _$this._onDispatch = onDispatch;

  Queue<PageRoutePath>? _pageStack;
  Queue<PageRoutePath>? get pageStack => _$this._pageStack;
  set pageStack(Queue<PageRoutePath>? pageStack) =>
      _$this._pageStack = pageStack;

  bool? _isOnboarded;
  bool? get isOnboarded => _$this._isOnboarded;
  set isOnboarded(bool? isOnboarded) => _$this._isOnboarded = isOnboarded;

  NavigationViewModelBuilder();

  NavigationViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _onDispatch = $v.onDispatch;
      _pageStack = $v.pageStack;
      _isOnboarded = $v.isOnboarded;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationViewModel;
  }

  @override
  void update(void Function(NavigationViewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationViewModel build() => _build();

  _$NavigationViewModel _build() {
    final _$result = _$v ??
        new _$NavigationViewModel._(
            onDispatch: BuiltValueNullFieldError.checkNotNull(
                onDispatch, r'NavigationViewModel', 'onDispatch'),
            pageStack: BuiltValueNullFieldError.checkNotNull(
                pageStack, r'NavigationViewModel', 'pageStack'),
            isOnboarded: BuiltValueNullFieldError.checkNotNull(
                isOnboarded, r'NavigationViewModel', 'isOnboarded'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
