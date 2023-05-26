part of 'cubit.dart';

enum LifecycleState { background, foreground, paused }

@JsonSerializable()
final class AppLifeCycleState extends Equatable {
  const AppLifeCycleState({
    this.status = LifecycleState.foreground,
  });

  factory AppLifeCycleState.fromJson(Map<String, dynamic> json) =>
      _$AppLifeCycleStateFromJson(json);

  final LifecycleState status;

  Map<String, dynamic> toJson() => _$AppLifeCycleStateToJson(this);

  AppLifeCycleState copyWith({LifecycleState? status}) {
    return AppLifeCycleState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
