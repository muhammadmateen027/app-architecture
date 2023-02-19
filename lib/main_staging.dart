import 'package:dio/dio.dart';
import 'package:stars/api/dio/api.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/app/app.dart';
import 'package:stars/bootstrap.dart';

void main({
  Environment environment = Environment.staging,
}) {
  final dio = Dio();
  final api = ApiImpl(dio,);


  bootstrap(() => App(api: api));
}
