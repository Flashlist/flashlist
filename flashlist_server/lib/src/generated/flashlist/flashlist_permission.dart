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

abstract class FlashlistPermission
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FlashlistPermission._({
    this.id,
    required this.userId,
    required this.flashlistId,
    required this.accessLevel,
  });

  factory FlashlistPermission({
    int? id,
    required int userId,
    required int flashlistId,
    required String accessLevel,
  }) = _FlashlistPermissionImpl;

  factory FlashlistPermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlashlistPermission(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      flashlistId: jsonSerialization['flashlistId'] as int,
      accessLevel: jsonSerialization['accessLevel'] as String,
    );
  }

  static final t = FlashlistPermissionTable();

  static const db = FlashlistPermissionRepository._();

  @override
  int? id;

  int userId;

  int flashlistId;

  String accessLevel;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FlashlistPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FlashlistPermission copyWith({
    int? id,
    int? userId,
    int? flashlistId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  static FlashlistPermissionInclude include() {
    return FlashlistPermissionInclude._();
  }

  static FlashlistPermissionIncludeList includeList({
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistPermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistPermissionTable>? orderByList,
    FlashlistPermissionInclude? include,
  }) {
    return FlashlistPermissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FlashlistPermission.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FlashlistPermission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashlistPermissionImpl extends FlashlistPermission {
  _FlashlistPermissionImpl({
    int? id,
    required int userId,
    required int flashlistId,
    required String accessLevel,
  }) : super._(
          id: id,
          userId: userId,
          flashlistId: flashlistId,
          accessLevel: accessLevel,
        );

  /// Returns a shallow copy of this [FlashlistPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FlashlistPermission copyWith({
    Object? id = _Undefined,
    int? userId,
    int? flashlistId,
    String? accessLevel,
  }) {
    return FlashlistPermission(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      flashlistId: flashlistId ?? this.flashlistId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}

class FlashlistPermissionTable extends _i1.Table<int?> {
  FlashlistPermissionTable({super.tableRelation})
      : super(tableName: 'flashlist_permission') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    flashlistId = _i1.ColumnInt(
      'flashlistId',
      this,
    );
    accessLevel = _i1.ColumnString(
      'accessLevel',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt flashlistId;

  late final _i1.ColumnString accessLevel;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        flashlistId,
        accessLevel,
      ];
}

class FlashlistPermissionInclude extends _i1.IncludeObject {
  FlashlistPermissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => FlashlistPermission.t;
}

class FlashlistPermissionIncludeList extends _i1.IncludeList {
  FlashlistPermissionIncludeList._({
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FlashlistPermission.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => FlashlistPermission.t;
}

class FlashlistPermissionRepository {
  const FlashlistPermissionRepository._();

  /// Returns a list of [FlashlistPermission]s matching the given query parameters.
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
  Future<List<FlashlistPermission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistPermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistPermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      orderBy: orderBy?.call(FlashlistPermission.t),
      orderByList: orderByList?.call(FlashlistPermission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [FlashlistPermission] matching the given query parameters.
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
  Future<FlashlistPermission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashlistPermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistPermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      orderBy: orderBy?.call(FlashlistPermission.t),
      orderByList: orderByList?.call(FlashlistPermission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [FlashlistPermission] by its [id] or null if no such row exists.
  Future<FlashlistPermission?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FlashlistPermission>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [FlashlistPermission]s in the list and returns the inserted rows.
  ///
  /// The returned [FlashlistPermission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<FlashlistPermission>> insert(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FlashlistPermission>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [FlashlistPermission] and returns the inserted row.
  ///
  /// The returned [FlashlistPermission] will have its `id` field set.
  Future<FlashlistPermission> insertRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FlashlistPermission>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [FlashlistPermission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<FlashlistPermission>> update(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.ColumnSelections<FlashlistPermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FlashlistPermission>(
      rows,
      columns: columns?.call(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FlashlistPermission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FlashlistPermission> updateRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.ColumnSelections<FlashlistPermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FlashlistPermission>(
      row,
      columns: columns?.call(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  /// Deletes all [FlashlistPermission]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<FlashlistPermission>> delete(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FlashlistPermission>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [FlashlistPermission].
  Future<FlashlistPermission> deleteRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FlashlistPermission>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<FlashlistPermission>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistPermissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FlashlistPermission>(
      where: where(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
