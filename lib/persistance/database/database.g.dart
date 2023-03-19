// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserAccountsTable extends UserAccounts
    with TableInfo<$UserAccountsTable, UserAccountsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, accountType, username, email, password];
  @override
  String get aliasedName => _alias ?? 'user_accounts';
  @override
  String get actualTableName => 'user_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<UserAccountsEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserAccountsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAccountsEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
    );
  }

  @override
  $UserAccountsTable createAlias(String alias) {
    return $UserAccountsTable(attachedDatabase, alias);
  }
}

class UserAccountsEntry extends DataClass
    implements Insertable<UserAccountsEntry> {
  final int id;
  final String accountType;
  final String? username;
  final String? email;
  final String? password;
  const UserAccountsEntry(
      {required this.id,
      required this.accountType,
      this.username,
      this.email,
      this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_type'] = Variable<String>(accountType);
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  UserAccountsCompanion toCompanion(bool nullToAbsent) {
    return UserAccountsCompanion(
      id: Value(id),
      accountType: Value(accountType),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory UserAccountsEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAccountsEntry(
      id: serializer.fromJson<int>(json['id']),
      accountType: serializer.fromJson<String>(json['accountType']),
      username: serializer.fromJson<String?>(json['username']),
      email: serializer.fromJson<String?>(json['email']),
      password: serializer.fromJson<String?>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountType': serializer.toJson<String>(accountType),
      'username': serializer.toJson<String?>(username),
      'email': serializer.toJson<String?>(email),
      'password': serializer.toJson<String?>(password),
    };
  }

  UserAccountsEntry copyWith(
          {int? id,
          String? accountType,
          Value<String?> username = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> password = const Value.absent()}) =>
      UserAccountsEntry(
        id: id ?? this.id,
        accountType: accountType ?? this.accountType,
        username: username.present ? username.value : this.username,
        email: email.present ? email.value : this.email,
        password: password.present ? password.value : this.password,
      );
  @override
  String toString() {
    return (StringBuffer('UserAccountsEntry(')
          ..write('id: $id, ')
          ..write('accountType: $accountType, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountType, username, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAccountsEntry &&
          other.id == this.id &&
          other.accountType == this.accountType &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password);
}

class UserAccountsCompanion extends UpdateCompanion<UserAccountsEntry> {
  final Value<int> id;
  final Value<String> accountType;
  final Value<String?> username;
  final Value<String?> email;
  final Value<String?> password;
  const UserAccountsCompanion({
    this.id = const Value.absent(),
    this.accountType = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  UserAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String accountType,
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  }) : accountType = Value(accountType);
  static Insertable<UserAccountsEntry> custom({
    Expression<int>? id,
    Expression<String>? accountType,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountType != null) 'account_type': accountType,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  UserAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountType,
      Value<String?>? username,
      Value<String?>? email,
      Value<String?>? password}) {
    return UserAccountsCompanion(
      id: id ?? this.id,
      accountType: accountType ?? this.accountType,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountType: $accountType, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $UserAccountsTable userAccounts = $UserAccountsTable(this);
  late final UserAccountsDao userAccountsDao =
      UserAccountsDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userAccounts];
}
