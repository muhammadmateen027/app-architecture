import 'package:drift/drift.dart';
import 'package:stars/persistance/database/upgrade.dart';

class DropUsers extends MigrationUpgrade {
  const DropUsers(super.database);

  @override
  Future<void> onUpgrade(Migrator m, int from, int to) async {
    await m.drop(database.userAccounts);
    await m.createTable(database.userAccounts);
  }
}
