import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:stars/persistance/constants.dart';
import 'package:stars/persistance/database/database.dart';
import 'package:stars/persistance/database/migrations/drop_all.dart';
import 'package:stars/persistance/database/migrations/drop_users.dart';

abstract class MigrationUpgrade {
  const MigrationUpgrade(this.database);

  final Database database;

  Future<void> onUpgrade(final Migrator m, final int from, final int to);
}

class UpgradeRunner extends MigrationUpgrade {
  const UpgradeRunner(final Database database) : super(database);

  List<MigrationUpgrade> get upgrades => [
    DropUsers(database),
    DropUsers(database),
    DropAll(database),
  ];

  @override
  Future<void> onUpgrade(final Migrator m, final int from, final int to) async {
    assert(isUnderTest || to >= upgrades.length);

    try {
      for (var i = from - 1; i < to - 1; ++i) {
        final migration = upgrades[i];
        log('Running migration ${migration.runtimeType}');
        await migration.onUpgrade(m, from, to);
        log('Running migration ${migration.runtimeType}... Done!');
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      log('Failed to migrate $e', error: e);

      rethrow;
    }
  }
}