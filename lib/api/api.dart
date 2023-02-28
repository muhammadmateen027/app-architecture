import 'package:stars/api/dto/dtos.dart';

abstract class Api {
  Future<LaunchesListDto> launches();
  Future<LaunchDto> getLaunch(String id);
}
