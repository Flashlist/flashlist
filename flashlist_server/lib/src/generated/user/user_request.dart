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

abstract class UserRequest extends _i1.TableRow {
  UserRequest._({
    int? id,
    required this.userId1,
    required this.userId2,
    required this.type,
    this.data,
    required this.timestamp,
  }) : super(id);

  factory UserRequest({
    int? id,
    required int userId1,
    required int userId2,
    required String type,
    int? data,
    required DateTime timestamp,
  }) = _UserRequestImpl;

  factory UserRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId1:
          serializationManager.deserialize<int>(jsonSerialization['userId1']),
      userId2:
          serializationManager.deserialize<int>(jsonSerialization['userId2']),
      type: serializationManager.deserialize<String>(jsonSerialization['type']),
      data: serializationManager.deserialize<int?>(jsonSerialization['data']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
    );
  }

  static final t = UserRequestTable();

  static const db = UserRequestRepository._();

  int userId1;

  int userId2;

  String type;

  int? data;

  DateTime timestamp;

  @override
  _i1.Table get table => t;

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
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId1': userId1,
      'userId2': userId2,
      'type': type,
      'data': data,
      'timestamp': timestamp,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      case 'type':
        type = value;
        return;
      case 'data':
        data = value;
        return;
      case 'timestamp':
        timestamp = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<UserRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserRequest>(
      where: where != null ? where(UserRequest.t) : null,
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
  static Future<UserRequest?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<UserRequest>(
      where: where != null ? where(UserRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<UserRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<UserRequest>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserRequest>(
      where: where(UserRequest.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    UserRequest row, {
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
    UserRequest row, {
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
    UserRequest row, {
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
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserRequest>(
      where: where != null ? where(UserRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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

class UserRequestTable extends _i1.Table {
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

@Deprecated('Use UserRequestTable.t instead.')
UserRequestTable tUserRequest = UserRequestTable();

class UserRequestInclude extends _i1.IncludeObject {
  UserRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => UserRequest.t;
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
  _i1.Table get table => UserRequest.t;
}

class UserRequestRepository {
  const UserRequestRepository._();

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
    return session.dbNext.find<UserRequest>(
      where: where?.call(UserRequest.t),
      orderBy: orderBy?.call(UserRequest.t),
      orderByList: orderByList?.call(UserRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<UserRequest>(
      where: where?.call(UserRequest.t),
      orderBy: orderBy?.call(UserRequest.t),
      orderByList: orderByList?.call(UserRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<UserRequest>(
      id,
      transaction: transaction,
    );
  }

  Future<List<UserRequest>> insert(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<UserRequest>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserRequest> insertRow(
    _i1.Session session,
    UserRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<UserRequest>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserRequest>> update(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.ColumnSelections<UserRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<UserRequest>(
      rows,
      columns: columns?.call(UserRequest.t),
      transaction: transaction,
    );
  }

  Future<UserRequest> updateRow(
    _i1.Session session,
    UserRequest row, {
    _i1.ColumnSelections<UserRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<UserRequest>(
      row,
      columns: columns?.call(UserRequest.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<UserRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<UserRequest>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    UserRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<UserRequest>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<UserRequest>(
      where: where(UserRequest.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<UserRequest>(
      where: where?.call(UserRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
