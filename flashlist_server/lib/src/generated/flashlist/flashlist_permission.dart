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
    implements _i1.TableRow, _i1.ProtocolSerialization {
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
