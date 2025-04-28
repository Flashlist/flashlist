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

abstract class UserRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserRequest._({
    this.id,
    required this.userId1,
    required this.userId2,
    required this.type,
    this.data,
    required this.timestamp,
  });

  factory UserRequest({
    int? id,
    required int userId1,
    required int userId2,
    required String type,
    int? data,
    required DateTime timestamp,
  }) = _UserRequestImpl;

  factory UserRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRequest(
      id: jsonSerialization['id'] as int?,
      userId1: jsonSerialization['userId1'] as int,
      userId2: jsonSerialization['userId2'] as int,
      type: jsonSerialization['type'] as String,
      data: jsonSerialization['data'] as int?,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
    );
  }

  static final t = UserRequestTable();

  static const db = UserRequestRepository._();

  @override
  int? id;

  int userId1;

  int userId2;

  String type;

  int? data;

  DateTime timestamp;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRequest copyWith({
    int? id,
    int? userId1,
    int? userId2,
    String? type,
    int? data,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'type': type,
      if (data != null) 'data': data,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'type': type,
      if (data != null) 'data': data,
      'timestamp': timestamp.toJson(),
    };
  }

  static UserRequestInclude include() {
    return UserRequestInclude._();
  }

  static UserRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRequestTable>? orderByList,
    UserRequestInclude? include,
  }) {
    return UserRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserRequestImpl extends UserRequest {
  _UserRequestImpl({
    int? id,
    required int userId1,
    required int userId2,
    required String type,
    int? data,
    required DateTime timestamp,
  }) : super._(
          id: id,
          userId1: userId1,
          userId2: userId2,
          type: type,
          data: data,
          timestamp: timestamp,
        );

  /// Returns a shallow copy of this [UserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRequest copyWith({
    Object? id = _Undefined,
    int? userId1,
    int? userId2,
    String? type,
    Object? data = _Undefined,
    DateTime? timestamp,
  }) {
    return UserRequest(
      id: id is int? ? id : this.id,
      userId1: userId1 ?? this.userId1,
      userId2: userId2 ?? this.userId2,
      type: type ?? this.type,
      data: data is int? ? data : this.data,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class UserRequestTable extends _i1.Table<int?> {
  UserRequestTable({super.tableRelation})
      : super(tableName: 'flashlist_user_request') {
    userId1 = _i1.ColumnInt(
      'userId1',
      this,
    );
    userId2 = _i1.ColumnInt(
      'userId2',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    data = _i1.ColumnInt(
      'data',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
  }

  late final _i1.ColumnInt userId1;

  late final _i1.ColumnInt userId2;

  late final _i1.ColumnString type;

  late final _i1.ColumnInt data;

  late final _i1.ColumnDateTime timestamp;

  @override
  List<_i1.Column> get columns => [
        id,
        userId1,
        userId2,
        type,
        data,
        timestamp,
      ];
}

class UserRequestInclude extends _i1.IncludeObject {
  UserRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserRequest.t;
}

class UserRequestIncludeList extends _i1.IncludeList {
  UserRequestIncludeList._({
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserRequest.t;
}

class UserRequestRepository {
  const UserRequestRepository._();

  /// Returns a list of [UserRequest]s matching the given query parameters.
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
  Future<List<UserRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserRequest>(
      where: where?.call(UserRequest.t),
      orderBy: orderBy?.call(UserRequest.t),
      orderByList: orderByList?.call(UserRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserRequest] matching the given query parameters.
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
  Future<UserRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserRequest>(
      where: where?.call(UserRequest.t),
      orderBy: orderBy?.call(UserRequest.t),
      orderByList: orderByList?.call(UserRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserRequest] by its [id] or null if no such row exists.
  Future<UserRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserRequest>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [UserRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserRequest>> insert(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserRequest] and returns the inserted row.
  ///
  /// The returned [UserRequest] will have its `id` field set.
  Future<UserRequest> insertRow(
    _i1.Session session,
    UserRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserRequest>> update(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.ColumnSelections<UserRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserRequest>(
      rows,
      columns: columns?.call(UserRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserRequest> updateRow(
    _i1.Session session,
    UserRequest row, {
    _i1.ColumnSelections<UserRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserRequest>(
      row,
      columns: columns?.call(UserRequest.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserRequest>> delete(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserRequest].
  Future<UserRequest> deleteRow(
    _i1.Session session,
    UserRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserRequest>(
      where: where(UserRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRequest>(
      where: where?.call(UserRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
