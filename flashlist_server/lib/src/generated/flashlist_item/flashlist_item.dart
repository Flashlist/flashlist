/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class FlashlistItem extends _i1.TableRow {
  FlashlistItem._({
    int? id,
    required this.name,
    required this.orderNr,
  }) : super(id);

  factory FlashlistItem({
    int? id,
    required String name,
    required int orderNr,
  }) = _FlashlistItemImpl;

  factory FlashlistItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FlashlistItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      orderNr:
          serializationManager.deserialize<int>(jsonSerialization['orderNr']),
    );
  }

  static final t = FlashlistItemTable();

  static const db = FlashlistItemRepository._();

  String name;

  int orderNr;

  @override
  _i1.Table get table => t;

  FlashlistItem copyWith({
    int? id,
    String? name,
    int? orderNr,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'orderNr': orderNr,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'orderNr': orderNr,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'orderNr': orderNr,
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
      case 'name':
        name = value;
        return;
      case 'orderNr':
        orderNr = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<FlashlistItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FlashlistItem>(
      where: where != null ? where(FlashlistItem.t) : null,
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
  static Future<FlashlistItem?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<FlashlistItem>(
      where: where != null ? where(FlashlistItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<FlashlistItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<FlashlistItem>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FlashlistItem>(
      where: where(FlashlistItem.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    FlashlistItem row, {
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
    FlashlistItem row, {
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
    FlashlistItem row, {
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
    _i1.WhereExpressionBuilder<FlashlistItemTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FlashlistItem>(
      where: where != null ? where(FlashlistItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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
}

class _Undefined {}

class _FlashlistItemImpl extends FlashlistItem {
  _FlashlistItemImpl({
    int? id,
    required String name,
    required int orderNr,
  }) : super._(
          id: id,
          name: name,
          orderNr: orderNr,
        );

  @override
  FlashlistItem copyWith({
    Object? id = _Undefined,
    String? name,
    int? orderNr,
  }) {
    return FlashlistItem(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
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
    orderNr = _i1.ColumnInt(
      'orderNr',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt orderNr;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        orderNr,
      ];
}

@Deprecated('Use FlashlistItemTable.t instead.')
FlashlistItemTable tFlashlistItem = FlashlistItemTable();

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
    return session.dbNext.find<FlashlistItem>(
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
    return session.dbNext.findFirstRow<FlashlistItem>(
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
    return session.dbNext.findById<FlashlistItem>(
      id,
      transaction: transaction,
    );
  }

  Future<List<FlashlistItem>> insert(
    _i1.Session session,
    List<FlashlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<FlashlistItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<FlashlistItem> insertRow(
    _i1.Session session,
    FlashlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<FlashlistItem>(
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
    return session.dbNext.update<FlashlistItem>(
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
    return session.dbNext.updateRow<FlashlistItem>(
      row,
      columns: columns?.call(FlashlistItem.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<FlashlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<FlashlistItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    FlashlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<FlashlistItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<FlashlistItem>(
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
    return session.dbNext.count<FlashlistItem>(
      where: where?.call(FlashlistItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
