/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UserRelation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserRelation._({
    this.id,
    required this.userId1,
    required this.userId2,
    required this.timestamp,
    required this.type,
  });

  factory UserRelation({
    int? id,
    required int userId1,
    required int userId2,
    required DateTime timestamp,
    required String type,
  }) = _UserRelationImpl;

  factory UserRelation.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRelation(
      id: jsonSerialization['id'] as int?,
      userId1: jsonSerialization['userId1'] as int,
      userId2: jsonSerialization['userId2'] as int,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      type: jsonSerialization['type'] as String,
    );
  }

  static final t = UserRelationTable();

  static const db = UserRelationRepository._();

  @override
  int? id;

  int userId1;

  int userId2;

  DateTime timestamp;

  String type;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRelation copyWith({
    int? id,
    int? userId1,
    int? userId2,
    DateTime? timestamp,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'timestamp': timestamp.toJson(),
      'type': type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'timestamp': timestamp.toJson(),
      'type': type,
    };
  }

  static UserRelationInclude include() {
    return UserRelationInclude._();
  }

  static UserRelationIncludeList includeList({
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRelationTable>? orderByList,
    UserRelationInclude? include,
  }) {
    return UserRelationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserRelation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserRelation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserRelationImpl extends UserRelation {
  _UserRelationImpl({
    int? id,
    required int userId1,
    required int userId2,
    required DateTime timestamp,
    required String type,
  }) : super._(
          id: id,
          userId1: userId1,
          userId2: userId2,
          timestamp: timestamp,
          type: type,
        );

  /// Returns a shallow copy of this [UserRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRelation copyWith({
    Object? id = _Undefined,
    int? userId1,
    int? userId2,
    DateTime? timestamp,
    String? type,
  }) {
    return UserRelation(
      id: id is int? ? id : this.id,
      userId1: userId1 ?? this.userId1,
      userId2: userId2 ?? this.userId2,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
    );
  }
}

class UserRelationTable extends _i1.Table<int?> {
  UserRelationTable({super.tableRelation})
      : super(tableName: 'flashlist_user_relation') {
    userId1 = _i1.ColumnInt(
      'userId1',
      this,
    );
    userId2 = _i1.ColumnInt(
      'userId2',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
  }

  late final _i1.ColumnInt userId1;

  late final _i1.ColumnInt userId2;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString type;

  @override
  List<_i1.Column> get columns => [
        id,
        userId1,
        userId2,
        timestamp,
        type,
      ];
}

class UserRelationInclude extends _i1.IncludeObject {
  UserRelationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserRelation.t;
}

class UserRelationIncludeList extends _i1.IncludeList {
  UserRelationIncludeList._({
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserRelation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserRelation.t;
}

class UserRelationRepository {
  const UserRelationRepository._();

  /// Returns a list of [UserRelation]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<UserRelation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRelationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserRelation>(
      where: where?.call(UserRelation.t),
      orderBy: orderBy?.call(UserRelation.t),
      orderByList: orderByList?.call(UserRelation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserRelation] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<UserRelation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRelationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserRelation>(
      where: where?.call(UserRelation.t),
      orderBy: orderBy?.call(UserRelation.t),
      orderByList: orderByList?.call(UserRelation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserRelation] by its [id] or null if no such row exists.
  Future<UserRelation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserRelation>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserRelation]s in the list and returns the inserted rows.
  ///
  /// The returned [UserRelation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserRelation>> insert(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserRelation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserRelation] and returns the inserted row.
  ///
  /// The returned [UserRelation] will have its `id` field set.
  Future<UserRelation> insertRow(
    _i1.Session session,
    UserRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserRelation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserRelation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserRelation>> update(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.ColumnSelections<UserRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserRelation>(
      rows,
      columns: columns?.call(UserRelation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserRelation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserRelation> updateRow(
    _i1.Session session,
    UserRelation row, {
    _i1.ColumnSelections<UserRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserRelation>(
      row,
      columns: columns?.call(UserRelation.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserRelation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserRelation>> delete(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRelation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserRelation].
  Future<UserRelation> deleteRow(
    _i1.Session session,
    UserRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserRelation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserRelation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRelationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserRelation>(
      where: where(UserRelation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRelation>(
      where: where?.call(UserRelation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
