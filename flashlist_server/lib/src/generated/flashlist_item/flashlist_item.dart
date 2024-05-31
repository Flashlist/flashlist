/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class FlashlistItem extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  FlashlistItem._({
    int? id,
    required this.name,
    required this.parentId,
    required this.orderNr,
  }) : super(id);

  factory FlashlistItem({
    int? id,
    required String name,
    required int parentId,
    required int orderNr,
  }) = _FlashlistItemImpl;

  factory FlashlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlashlistItem(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      parentId: jsonSerialization['parentId'] as int,
      orderNr: jsonSerialization['orderNr'] as int,
    );
  }

  static final t = FlashlistItemTable();

  static const db = FlashlistItemRepository._();

  String name;

  int parentId;

  int orderNr;

  @override
  _i1.Table get table => t;

  FlashlistItem copyWith({
    int? id,
    String? name,
    int? parentId,
    int? orderNr,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'parentId': parentId,
      'orderNr': orderNr,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'parentId': parentId,
      'orderNr': orderNr,
    };
  }

  static FlashlistItemInclude include() {
    return FlashlistItemInclude._();
  }

  static FlashlistItemIncludeList includeList({
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistItemTable>? orderByList,
    FlashlistItemInclude? include,
  }) {
    return FlashlistItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FlashlistItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FlashlistItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashlistItemImpl extends FlashlistItem {
  _FlashlistItemImpl({
    int? id,
    required String name,
    required int parentId,
    required int orderNr,
  }) : super._(
          id: id,
          name: name,
          parentId: parentId,
          orderNr: orderNr,
        );

  @override
  FlashlistItem copyWith({
    Object? id = _Undefined,
    String? name,
    int? parentId,
    int? orderNr,
  }) {
    return FlashlistItem(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      orderNr: orderNr ?? this.orderNr,
    );
  }
}

class FlashlistItemTable extends _i1.Table {
  FlashlistItemTable({super.tableRelation})
      : super(tableName: 'flashlist_flashlist_item') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
    orderNr = _i1.ColumnInt(
      'orderNr',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt parentId;

  late final _i1.ColumnInt orderNr;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        parentId,
        orderNr,
      ];
}

class FlashlistItemInclude extends _i1.IncludeObject {
  FlashlistItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => FlashlistItem.t;
}

class FlashlistItemIncludeList extends _i1.IncludeList {
  FlashlistItemIncludeList._({
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FlashlistItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => FlashlistItem.t;
}

class FlashlistItemRepository {
  const FlashlistItemRepository._();

  Future<List<FlashlistItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FlashlistItem>(
      where: where?.call(FlashlistItem.t),
      orderBy: orderBy?.call(FlashlistItem.t),
      orderByList: orderByList?.call(FlashlistItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FlashlistItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FlashlistItem>(
      where: where?.call(FlashlistItem.t),
      orderBy: orderBy?.call(FlashlistItem.t),
      orderByList: orderByList?.call(FlashlistItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FlashlistItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FlashlistItem>(
      id,
      transaction: transaction,
    );
  }

  Future<List<FlashlistItem>> insert(
    _i1.Session session,
    List<FlashlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FlashlistItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<FlashlistItem> insertRow(
    _i1.Session session,
    FlashlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FlashlistItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FlashlistItem>> update(
    _i1.Session session,
    List<FlashlistItem> rows, {
    _i1.ColumnSelections<FlashlistItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FlashlistItem>(
      rows,
      columns: columns?.call(FlashlistItem.t),
      transaction: transaction,
    );
  }

  Future<FlashlistItem> updateRow(
    _i1.Session session,
    FlashlistItem row, {
    _i1.ColumnSelections<FlashlistItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FlashlistItem>(
      row,
      columns: columns?.call(FlashlistItem.t),
      transaction: transaction,
    );
  }

  Future<List<FlashlistItem>> delete(
    _i1.Session session,
    List<FlashlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FlashlistItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<FlashlistItem> deleteRow(
    _i1.Session session,
    FlashlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FlashlistItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FlashlistItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FlashlistItem>(
      where: where(FlashlistItem.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FlashlistItem>(
      where: where?.call(FlashlistItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
