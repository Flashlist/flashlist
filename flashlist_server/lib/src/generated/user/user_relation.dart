/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class UserRelation extends _i1.TableRow {
  UserRelation._({
    int? id,
    required this.userId1,
    required this.userId2,
    required this.timestamp,
    required this.type,
  }) : super(id);

  factory UserRelation({
    int? id,
    required int userId1,
    required int userId2,
    required DateTime timestamp,
    required String type,
  }) = _UserRelationImpl;

  factory UserRelation.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserRelation(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId1:
          serializationManager.deserialize<int>(jsonSerialization['userId1']),
      userId2:
          serializationManager.deserialize<int>(jsonSerialization['userId2']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
      type: serializationManager.deserialize<String>(jsonSerialization['type']),
    );
  }

  static final t = UserRelationTable();

  static const db = UserRelationRepository._();

  int userId1;

  int userId2;

  DateTime timestamp;

  String type;

  @override
  _i1.Table get table => t;

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
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'timestamp': timestamp,
      'type': type,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'timestamp': timestamp.toJson(),
      'type': type,
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
      case 'userId1':
        userId1 = value;
        return;
      case 'userId2':
        userId2 = value;
        return;
      case 'timestamp':
        timestamp = value;
        return;
      case 'type':
        type = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<UserRelation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserRelation>(
      where: where != null ? where(UserRelation.t) : null,
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
  static Future<UserRelation?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<UserRelation>(
      where: where != null ? where(UserRelation.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<UserRelation?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<UserRelation>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRelationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRelation>(
      where: where(UserRelation.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    UserRelation row, {
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
    UserRelation row, {
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
    UserRelation row, {
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
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRelation>(
      where: where != null ? where(UserRelation.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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

class UserRelationTable extends _i1.Table {
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

@Deprecated('Use UserRelationTable.t instead.')
UserRelationTable tUserRelation = UserRelationTable();

class UserRelationInclude extends _i1.IncludeObject {
  UserRelationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => UserRelation.t;
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
  _i1.Table get table => UserRelation.t;
}

class UserRelationRepository {
  const UserRelationRepository._();

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
    return session.dbNext.find<UserRelation>(
      where: where?.call(UserRelation.t),
      orderBy: orderBy?.call(UserRelation.t),
      orderByList: orderByList?.call(UserRelation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserRelation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRelationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<UserRelation>(
      where: where?.call(UserRelation.t),
      orderBy: orderBy?.call(UserRelation.t),
      orderByList: orderByList?.call(UserRelation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserRelation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<UserRelation>(
      id,
      transaction: transaction,
    );
  }

  Future<List<UserRelation>> insert(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<UserRelation>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserRelation> insertRow(
    _i1.Session session,
    UserRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<UserRelation>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserRelation>> update(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.ColumnSelections<UserRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<UserRelation>(
      rows,
      columns: columns?.call(UserRelation.t),
      transaction: transaction,
    );
  }

  Future<UserRelation> updateRow(
    _i1.Session session,
    UserRelation row, {
    _i1.ColumnSelections<UserRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<UserRelation>(
      row,
      columns: columns?.call(UserRelation.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<UserRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<UserRelation>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    UserRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<UserRelation>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRelationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<UserRelation>(
      where: where(UserRelation.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRelationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<UserRelation>(
      where: where?.call(UserRelation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
