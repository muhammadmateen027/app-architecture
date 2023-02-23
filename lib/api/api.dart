import 'package:stars/api/dto/dtos.dart';

abstract class Api {
  Future<LaunchesList> launches();
  Future<LaunchDto> getLaunch(String id);
}
