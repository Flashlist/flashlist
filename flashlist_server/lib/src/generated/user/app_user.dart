/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class AppUser extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  AppUser._({
    int? id,
    required this.userId,
    required this.username,
    required this.email,
    this.imageSrc,
  }) : super(id);

  factory AppUser({
    int? id,
    required int userId,
    required String username,
    required String email,
    String? imageSrc,
  }) = _AppUserImpl;

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      imageSrc: jsonSerialization['imageSrc'] as String?,
    );
  }

  static final t = AppUserTable();

  static const db = AppUserRepository._();

  int userId;

  String username;

  String email;

  String? imageSrc;

  @override
  _i1.Table get table => t;

  AppUser copyWith({
    int? id,
    int? userId,
    String? username,
    String? email,
    String? imageSrc,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'username': username,
      'email': email,
      if (imageSrc != null) 'imageSrc': imageSrc,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'username': username,
      'email': email,
      if (imageSrc != null) 'imageSrc': imageSrc,
    };
  }

  static AppUserInclude include() {
    return AppUserInclude._();
  }

  static AppUserIncludeList includeList({
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    AppUserInclude? include,
  }) {
    return AppUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    int? id,
    required int userId,
    required String username,
    required String email,
    String? imageSrc,
  }) : super._(
          id: id,
          userId: userId,
          username: username,
          email: email,
          imageSrc: imageSrc,
        );

  @override
  AppUser copyWith({
    Object? id = _Undefined,
    int? userId,
    String? username,
    String? email,
    Object? imageSrc = _Undefined,
  }) {
    return AppUser(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      imageSrc: imageSrc is String? ? imageSrc : this.imageSrc,
    );
  }
}

class AppUserTable extends _i1.Table {
  AppUserTable({super.tableRelation}) : super(tableName: 'flashlist_app_user') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    imageSrc = _i1.ColumnString(
      'imageSrc',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString username;

  late final _i1.ColumnString email;

  late final _i1.ColumnString imageSrc;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        username,
        email,
        imageSrc,
      ];
}

class AppUserInclude extends _i1.IncludeObject {
  AppUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => AppUser.t;
}

class AppUserIncludeList extends _i1.IncludeList {
  AppUserIncludeList._({
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => AppUser.t;
}

class AppUserRepository {
  const AppUserRepository._();

  Future<List<AppUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AppUser>(
      where: where?.call(AppUser.t),
      orderBy: orderBy?.call(AppUser.t),
      orderByList: orderByList?.call(AppUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<AppUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AppUser>(
      where: where?.call(AppUser.t),
      orderBy: orderBy?.call(AppUser.t),
      orderByList: orderByList?.call(AppUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<AppUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AppUser>(
      id,
      transaction: transaction,
    );
  }

  Future<List<AppUser>> insert(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppUser> insertRow(
    _i1.Session session,
    AppUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppUser>> update(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.ColumnSelections<AppUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppUser>(
      rows,
      columns: columns?.call(AppUser.t),
      transaction: transaction,
    );
  }

  Future<AppUser> updateRow(
    _i1.Session session,
    AppUser row, {
    _i1.ColumnSelections<AppUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppUser>(
      row,
      columns: columns?.call(AppUser.t),
      transaction: transaction,
    );
  }

  Future<List<AppUser>> delete(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppUser> deleteRow(
    _i1.Session session,
    AppUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppUser>(
      where: where(AppUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppUser>(
      where: where?.call(AppUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
