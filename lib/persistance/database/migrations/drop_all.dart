import 'package:drift/drift.dart';
import 'package:stars/persistance/database/upgrade.dart';

class DropAll extends MigrationUpgrade {
  const DropAll(super.database);

  @override
  Future<void> onUpgrade(Migrator m, int from, int to) async {
    for (final table in database.allTables) {
      await m.drop(table);
    }

    await m.createAll();
  }
}
