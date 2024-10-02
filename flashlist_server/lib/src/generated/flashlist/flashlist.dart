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
import '../protocol.dart' as _i2;

abstract class Flashlist implements _i1.TableRow, _i1.ProtocolSerialization {
  Flashlist._({
    this.id,
    required this.uuid,
    required this.title,
    required this.color,
    this.items,
    this.authors,
    this.isCollapsed,
    required this.createdAt,
    this.updatedAt,
  });

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

  factory Flashlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flashlist(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      title: jsonSerialization['title'] as String,
      color: jsonSerialization['color'] as String,
      items: (jsonSerialization['items'] as List?)
          ?.map((e) => e == null
              ? null
              : _i2.FlashlistItem.fromJson((e as Map<String, dynamic>)))
          .toList(),
      authors: (jsonSerialization['authors'] as List?)
          ?.map((e) => e == null
              ? null
              : _i2.AppUser.fromJson((e as Map<String, dynamic>)))
          .toList(),
      isCollapsed: jsonSerialization['isCollapsed'] as bool?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = FlashlistTable();

  static const db = FlashlistRepository._();

  @override
  int? id;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'title': title,
      'color': color,
      if (items != null)
        'items': items?.toJson(valueToJson: (v) => v?.toJsonForProtocol()),
      if (authors != null)
        'authors': authors?.toJson(valueToJson: (v) => v?.toJsonForProtocol()),
      if (isCollapsed != null) 'isCollapsed': isCollapsed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
      items: items is List<_i2.FlashlistItem?>?
          ? items
          : this.items?.map((e0) => e0?.copyWith()).toList(),
      authors: authors is List<_i2.AppUser?>?
          ? authors
          : this.authors?.map((e0) => e0?.copyWith()).toList(),
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
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlashlistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<Flashlist>(
      where: where?.call(Flashlist.t),
      orderBy: orderBy?.call(Flashlist.t),
      orderByList: orderByList?.call(Flashlist.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Flashlist?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlashlistTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlashlistTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<Flashlist>(
      where: where?.call(Flashlist.t),
      orderBy: orderBy?.call(Flashlist.t),
      orderByList: orderByList?.call(Flashlist.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Flashlist?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<Flashlist>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Flashlist>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Flashlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Flashlist>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Flashlist> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Flashlist row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Flashlist>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Flashlist>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Flashlist> rows, {
    _i1.ColumnSelections<FlashlistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Flashlist>(
      rows,
      columns: columns?.call(Flashlist.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Flashlist> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Flashlist row, {
    _i1.ColumnSelections<FlashlistTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Flashlist>(
      row,
      columns: columns?.call(Flashlist.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Flashlist>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Flashlist> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Flashlist>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Flashlist> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Flashlist row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Flashlist>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Flashlist>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<FlashlistTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Flashlist>(
      where: where(Flashlist.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<FlashlistTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Flashlist>(
      where: where?.call(Flashlist.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
