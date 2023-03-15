import 'package:drift/drift.dart';
import 'package:stars/persistance/database/database.dart';
import 'package:stars/persistance/database/upgrade.dart';

class DropUsers extends MigrationUpgrade {
  const DropUsers(final Database database) : super(database);

  @override
  Future<void> onUpgrade(final Migrator m, final int from, final int to) async {
    await m.drop(database.userAccounts);
    await m.createTable(database.userAccounts);
  }
}
