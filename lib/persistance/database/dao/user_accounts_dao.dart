import 'package:drift/drift.dart';
import 'package:stars/persistance/database/database.dart';

part 'user_accounts_dao.g.dart';

@DriftAccessor(tables: [UserAccounts])
class UserAccountsDao extends DatabaseAccessor<Database>
    with _$UserAccountsDaoMixin {
  UserAccountsDao(final Database db) : super(db);

  Future<int> insert(final UserAccountsCompanion entry) =>
      into(userAccounts).insert(entry, mode: InsertMode.insertOrReplace);

  Future<UserAccountsEntry?> entryByAccountType(final String id) =>
      (select(userAccounts)..where((final user) => user.accountType.equals(id)))
          .getSingleOrNull();

  Future<List<UserAccountsEntry>> get all async => select(userAccounts).get();
}
