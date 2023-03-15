import 'package:drift/drift.dart';
import 'package:stars/persistance/database/database.dart';
import 'package:stars/persistance/database/upgrade.dart';

class DropAll extends MigrationUpgrade {
  const DropAll(final Database database) : super(database);

  @override
  Future<void> onUpgrade(final Migrator m, final int from, final int to) async {
    for (final table in database.allTables) {
      await m.drop(table);
    }

    await m.createAll();
  }
}
