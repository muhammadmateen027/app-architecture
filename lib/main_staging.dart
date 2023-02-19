import 'package:dio/dio.dart';
import 'package:stars/api/dio/api.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/app/app.dart';
import 'package:stars/app/routes/app_router.gr.dart';
import 'package:stars/bootstrap.dart';

void main({
  Environment environment = Environment.staging,
}) {
  final dio = Dio();
  final api = ApiImpl(dio,);

  final appRouter = AppRouter();

  bootstrap(() => App(api: api, appRouter: appRouter));
}
