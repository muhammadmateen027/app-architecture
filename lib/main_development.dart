import 'dart:io';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stars/app/app.dart';
import 'package:stars/bootstrap.dart';
import 'package:stars/persistance/database/database.dart';

Future<File> get _location async {
  final dbFolder = await getApplicationDocumentsDirectory();

  return File(p.join(dbFolder.path, 'your_db_name'));
}

void main() async {
  final database = Database(NativeDatabase(await _location));

  // TODO(daoInitialization): Initialize your dao while passing the database.

  // TODO(RepositoryInitialization): initialize your repository while passing
  //  respective dao

  await bootstrap(() => const App());
}
