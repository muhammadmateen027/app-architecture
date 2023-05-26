// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLifeCycleState _$AppLifeCycleStateFromJson(Map<String, dynamic> json) =>
    AppLifeCycleState(
      status: $enumDecodeNullable(_$LifecycleStateEnumMap, json['status']) ??
          LifecycleState.foreground,
    );

Map<String, dynamic> _$AppLifeCycleStateToJson(AppLifeCycleState instance) =>
    <String, dynamic>{
      'status': _$LifecycleStateEnumMap[instance.status]!,
    };

const _$LifecycleStateEnumMap = {
  LifecycleState.background: 'background',
  LifecycleState.foreground: 'foreground',
  LifecycleState.paused: 'paused',
};
