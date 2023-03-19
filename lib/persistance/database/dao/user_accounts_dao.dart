import 'package:drift/drift.dart';
import 'package:stars/persistance/database/database.dart';

part 'user_accounts_dao.g.dart';

@DriftAccessor(tables: [UserAccounts])
class UserAccountsDao extends DatabaseAccessor<Database>
    with _$UserAccountsDaoMixin {
  UserAccountsDao(super.db);

  Future<int> insert(UserAccountsCompanion entry) =>
      into(userAccounts).insert(entry, mode: InsertMode.insertOrReplace);

  Future<UserAccountsEntry?> entryByAccountType(String id) =>
      (select(userAccounts)..where((user) => user.accountType.equals(id)))
          .getSingleOrNull();

  Future<List<UserAccountsEntry>> get all async => select(userAccounts).get();
}
