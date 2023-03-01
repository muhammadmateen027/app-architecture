import 'package:stars/api/dto/dtos.dart';

abstract class Api {
  Future<List<LaunchDto>> launches();
  Future<LaunchDto> getLaunch(String id);
}
