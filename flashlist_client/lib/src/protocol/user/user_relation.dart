/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class UserRelation implements _i1.SerializableModel {
  UserRelation._({
    this.id,
    required this.userId1,
    required this.userId2,
    required this.timestamp,
    required this.type,
  });

  factory UserRelation({
    int? id,
    required int userId1,
    required int userId2,
    required DateTime timestamp,
    required String type,
  }) = _UserRelationImpl;

  factory UserRelation.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRelation(
      id: jsonSerialization['id'] as int?,
      userId1: jsonSerialization['userId1'] as int,
      userId2: jsonSerialization['userId2'] as int,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      type: jsonSerialization['type'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId1;

  int userId2;

  DateTime timestamp;

  String type;

  /// Returns a shallow copy of this [UserRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
  String toString() {
    return _i1.SerializationManager.encode(this);
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

  /// Returns a shallow copy of this [UserRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
