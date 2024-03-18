/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class FlashlistPermission extends _i1.TableRow {
  FlashlistPermission._({
    int? id,
    required this.userId,
    required this.flashlistId,
    required this.accessLevel,
  }) : super(id);

  factory FlashlistPermission({
    int? id,
    required int userId,
    required int flashlistId,
    required String accessLevel,
  }) = _FlashlistPermissionImpl;

  factory FlashlistPermission.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FlashlistPermission(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      flashlistId: serializationManager
          .deserialize<int>(jsonSerialization['flashlistId']),
      accessLevel: serializationManager
          .deserialize<String>(jsonSerialization['accessLevel']),
    );
  }

  static final t = FlashlistPermissionTable();

  static const db = FlashlistPermissionRepository._();

  int userId;

  int flashlistId;

  String accessLevel;

  @override
  _i1.Table get table => t;

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
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'flashlistId':
        flashlistId = value;
        return;
      case 'accessLevel':
        accessLevel = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<FlashlistPermission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FlashlistPermission>(
      where: where != null ? where(FlashlistPermission.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<FlashlistPermission?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<FlashlistPermission>(
      where: where != null ? where(FlashlistPermission.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<FlashlistPermission?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<FlashlistPermission>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistPermissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FlashlistPermission>(
      where: where(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FlashlistPermission>(
      where: where != null ? where(FlashlistPermission.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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

class FlashlistPermissionTable extends _i1.Table {
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

@Deprecated('Use FlashlistPermissionTable.t instead.')
FlashlistPermissionTable tFlashlistPermission = FlashlistPermissionTable();

class FlashlistPermissionInclude extends _i1.IncludeObject {
  FlashlistPermissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => FlashlistPermission.t;
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
  _i1.Table get table => FlashlistPermission.t;
}

class FlashlistPermissionRepository {
  const FlashlistPermissionRepository._();

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
    return session.dbNext.find<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      orderBy: orderBy?.call(FlashlistPermission.t),
      orderByList: orderByList?.call(FlashlistPermission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FlashlistPermission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashlistPermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistPermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      orderBy: orderBy?.call(FlashlistPermission.t),
      orderByList: orderByList?.call(FlashlistPermission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FlashlistPermission?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<FlashlistPermission>(
      id,
      transaction: transaction,
    );
  }

  Future<List<FlashlistPermission>> insert(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<FlashlistPermission>(
      rows,
      transaction: transaction,
    );
  }

  Future<FlashlistPermission> insertRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<FlashlistPermission>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FlashlistPermission>> update(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.ColumnSelections<FlashlistPermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<FlashlistPermission>(
      rows,
      columns: columns?.call(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  Future<FlashlistPermission> updateRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.ColumnSelections<FlashlistPermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<FlashlistPermission>(
      row,
      columns: columns?.call(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<FlashlistPermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<FlashlistPermission>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    FlashlistPermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<FlashlistPermission>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistPermissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<FlashlistPermission>(
      where: where(FlashlistPermission.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistPermissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<FlashlistPermission>(
      where: where?.call(FlashlistPermission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
