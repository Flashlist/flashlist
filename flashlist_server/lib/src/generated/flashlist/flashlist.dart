/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Flashlist extends _i1.TableRow {
  Flashlist._({
    int? id,
    required this.uuid,
    required this.title,
    required this.color,
    this.items,
    this.authors,
    this.isCollapsed,
    required this.createdAt,
    this.updatedAt,
  }) : super(id);

  factory Flashlist({
    int? id,
    required String uuid,
    required String title,
    required String color,
    List<_i2.FlashlistItem?>? items,
    List<_i2.AppUser?>? authors,
    bool? isCollapsed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _FlashlistImpl;

  factory Flashlist.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Flashlist(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uuid: serializationManager.deserialize<String>(jsonSerialization['uuid']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      color:
          serializationManager.deserialize<String>(jsonSerialization['color']),
      items: serializationManager
          .deserialize<List<_i2.FlashlistItem?>?>(jsonSerialization['items']),
      authors: serializationManager
          .deserialize<List<_i2.AppUser?>?>(jsonSerialization['authors']),
      isCollapsed: serializationManager
          .deserialize<bool?>(jsonSerialization['isCollapsed']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime?>(jsonSerialization['updatedAt']),
    );
  }

  static final t = FlashlistTable();

  static const db = FlashlistRepository._();

  String uuid;

  String title;

  String color;

  List<_i2.FlashlistItem?>? items;

  List<_i2.AppUser?>? authors;

  bool? isCollapsed;

  DateTime createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table get table => t;

  Flashlist copyWith({
    int? id,
    String? uuid,
    String? title,
    String? color,
    List<_i2.FlashlistItem?>? items,
    List<_i2.AppUser?>? authors,
    bool? isCollapsed,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'title': title,
      'color': color,
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v?.toJson()),
      if (authors != null)
        'authors': authors?.toJson(valueToJson: (v) => v?.toJson()),
      if (isCollapsed != null) 'isCollapsed': isCollapsed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'uuid': uuid,
      'title': title,
      'color': color,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'title': title,
      'color': color,
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v?.allToJson()),
      if (authors != null)
        'authors': authors?.toJson(valueToJson: (v) => v?.allToJson()),
      if (isCollapsed != null) 'isCollapsed': isCollapsed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
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
      case 'uuid':
        uuid = value;
        return;
      case 'title':
        title = value;
        return;
      case 'color':
        color = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      case 'updatedAt':
        updatedAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Flashlist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Flashlist>(
      where: where != null ? where(Flashlist.t) : null,
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
  static Future<Flashlist?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Flashlist>(
      where: where != null ? where(Flashlist.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Flashlist?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Flashlist>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Flashlist>(
      where: where(Flashlist.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Flashlist row, {
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
    Flashlist row, {
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
    Flashlist row, {
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
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Flashlist>(
      where: where != null ? where(Flashlist.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static FlashlistInclude include() {
    return FlashlistInclude._();
  }

  static FlashlistIncludeList includeList({
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistTable>? orderByList,
    FlashlistInclude? include,
  }) {
    return FlashlistIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Flashlist.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Flashlist.t),
      include: include,
    );
  }
}

class _Undefined {}

class _FlashlistImpl extends Flashlist {
  _FlashlistImpl({
    int? id,
    required String uuid,
    required String title,
    required String color,
    List<_i2.FlashlistItem?>? items,
    List<_i2.AppUser?>? authors,
    bool? isCollapsed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          uuid: uuid,
          title: title,
          color: color,
          items: items,
          authors: authors,
          isCollapsed: isCollapsed,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Flashlist copyWith({
    Object? id = _Undefined,
    String? uuid,
    String? title,
    String? color,
    Object? items = _Undefined,
    Object? authors = _Undefined,
    Object? isCollapsed = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Flashlist(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      color: color ?? this.color,
      items: items is List<_i2.FlashlistItem?>? ? items : this.items?.clone(),
      authors: authors is List<_i2.AppUser?>? ? authors : this.authors?.clone(),
      isCollapsed: isCollapsed is bool? ? isCollapsed : this.isCollapsed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class FlashlistTable extends _i1.Table {
  FlashlistTable({super.tableRelation}) : super(tableName: 'flashlist') {
    uuid = _i1.ColumnString(
      'uuid',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString uuid;

  late final _i1.ColumnString title;

  late final _i1.ColumnString color;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uuid,
        title,
        color,
        createdAt,
        updatedAt,
      ];
}

@Deprecated('Use FlashlistTable.t instead.')
FlashlistTable tFlashlist = FlashlistTable();

class FlashlistInclude extends _i1.IncludeObject {
  FlashlistInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Flashlist.t;
}

class FlashlistIncludeList extends _i1.IncludeList {
  FlashlistIncludeList._({
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Flashlist.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Flashlist.t;
}

class FlashlistRepository {
  const FlashlistRepository._();

  Future<List<Flashlist>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Flashlist>(
      where: where?.call(Flashlist.t),
      orderBy: orderBy?.call(Flashlist.t),
      orderByList: orderByList?.call(Flashlist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Flashlist?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashlistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Flashlist>(
      where: where?.call(Flashlist.t),
      orderBy: orderBy?.call(Flashlist.t),
      orderByList: orderByList?.call(Flashlist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Flashlist?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Flashlist>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Flashlist>> insert(
    _i1.Session session,
    List<Flashlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Flashlist>(
      rows,
      transaction: transaction,
    );
  }

  Future<Flashlist> insertRow(
    _i1.Session session,
    Flashlist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Flashlist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Flashlist>> update(
    _i1.Session session,
    List<Flashlist> rows, {
    _i1.ColumnSelections<FlashlistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Flashlist>(
      rows,
      columns: columns?.call(Flashlist.t),
      transaction: transaction,
    );
  }

  Future<Flashlist> updateRow(
    _i1.Session session,
    Flashlist row, {
    _i1.ColumnSelections<FlashlistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Flashlist>(
      row,
      columns: columns?.call(Flashlist.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Flashlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Flashlist>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Flashlist row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Flashlist>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlashlistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Flashlist>(
      where: where(Flashlist.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Flashlist>(
      where: where?.call(Flashlist.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
