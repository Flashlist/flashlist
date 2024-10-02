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

abstract class Notification implements _i1.TableRow, _i1.ProtocolSerialization {
  Notification._({
    this.id,
    required this.userId,
    required this.requestId,
    required this.type,
    required this.isRead,
    required this.timestamp,
  });

  factory Notification({
    int? id,
    required int userId,
    required int requestId,
    required String type,
    required bool isRead,
    required DateTime timestamp,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      requestId: jsonSerialization['requestId'] as int,
      type: jsonSerialization['type'] as String,
      isRead: jsonSerialization['isRead'] as bool,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
    );
  }

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
  int? id;

  int userId;

  int requestId;

  String type;

  bool isRead;

  DateTime timestamp;

  @override
  _i1.Table get table => t;

  Notification copyWith({
    int? id,
    int? userId,
    int? requestId,
    String? type,
    bool? isRead,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'requestId': requestId,
      'type': type,
      'isRead': isRead,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'requestId': requestId,
      'type': type,
      'isRead': isRead,
      'timestamp': timestamp.toJson(),
    };
  }

  static NotificationInclude include() {
    return NotificationInclude._();
  }

  static NotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    NotificationInclude? include,
  }) {
    return NotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Notification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    int? id,
    required int userId,
    required int requestId,
    required String type,
    required bool isRead,
    required DateTime timestamp,
  }) : super._(
          id: id,
          userId: userId,
          requestId: requestId,
          type: type,
          isRead: isRead,
          timestamp: timestamp,
        );

  @override
  Notification copyWith({
    Object? id = _Undefined,
    int? userId,
    int? requestId,
    String? type,
    bool? isRead,
    DateTime? timestamp,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      requestId: requestId ?? this.requestId,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class NotificationTable extends _i1.Table {
  NotificationTable({super.tableRelation})
      : super(tableName: 'flashlist_notification') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    requestId = _i1.ColumnInt(
      'requestId',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt requestId;

  late final _i1.ColumnString type;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnDateTime timestamp;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        requestId,
        type,
        isRead,
        timestamp,
      ];
}

class NotificationInclude extends _i1.IncludeObject {
  NotificationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Notification.t;
}

class NotificationIncludeList extends _i1.IncludeList {
  NotificationIncludeList._({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Notification.t;
}

class NotificationRepository {
  const NotificationRepository._();

  Future<List<Notification>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Notification?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Notification?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<Notification>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Notification>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Notification>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Notification> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Notification>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Notification>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Notification> rows, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Notification>(
      rows,
      columns: columns?.call(Notification.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Notification> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Notification row, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Notification>(
      row,
      columns: columns?.call(Notification.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Notification>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Notification>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Notification> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Notification>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Notification>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Notification>(
      where: where(Notification.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Notification>(
      where: where?.call(Notification.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
