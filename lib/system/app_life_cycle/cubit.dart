import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cubit.g.dart';

part 'state.dart';

class AppLifeCycleCubit extends Cubit<AppLifeCycleState> {
  AppLifeCycleCubit() : super(const AppLifeCycleState());

  void stateChangedAction(LifecycleState status) {
    emit(state.copyWith(status: status));
  }
}
