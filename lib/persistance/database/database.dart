import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:stars/persistance/database/dao/user_accounts_dao.dart';
import 'package:stars/persistance/database/upgrade.dart';

part 'database.g.dart';

@DataClassName('UserAccountsEntry')
class UserAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get accountType => text()();

  TextColumn get username => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get password => text().nullable()();
}

@DriftDatabase(tables: [UserAccounts], daos: [UserAccountsDao])
class Database extends _$Database {
  Database(super.e);

  //[Important Note]! whenever you change this number you should add new
  // migration and TESTS.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        log('Upgrade database from $from => $to...');

        return UpgradeRunner(this).onUpgrade(m, from, to);
      },
      beforeOpen: (details) async {
        // If you are using some big queries and need to stay in memory
        // The issue is with Android and lack of all default unix paths
        // https://github.com/SRombauts/SQLiteCpp/issues/128#issuecomment-304501634
        await customStatement('PRAGMA temp_store=2');
      },
    );
  }
}
