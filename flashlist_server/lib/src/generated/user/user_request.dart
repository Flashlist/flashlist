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

abstract class UserRequest extends _i1.TableRow
    implements _i1.ProtocolSerialization {
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
