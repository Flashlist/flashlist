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

abstract class FlashlistPermission implements _i1.SerializableModel {
  FlashlistPermission._({
    this.id,
    required this.userId,
    required this.flashlistId,
    required this.accessLevel,
  });

  factory FlashlistPermission({
    int? id,
    required int userId,
    required int flashlistId,
    required String accessLevel,
  }) = _FlashlistPermissionImpl;

  factory FlashlistPermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlashlistPermission(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      flashlistId: jsonSerialization['flashlistId'] as int,
      accessLevel: jsonSerialization['accessLevel'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int flashlistId;

  String accessLevel;

  /// Returns a shallow copy of this [FlashlistPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FlashlistPermission copyWith({
    int? id,
    int? userId,
    int? flashlistId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlashlistPermissionImpl extends FlashlistPermission {
  _FlashlistPermissionImpl({
    int? id,
    required int userId,
    required int flashlistId,
    required String accessLevel,
  }) : super._(
          id: id,
          userId: userId,
          flashlistId: flashlistId,
          accessLevel: accessLevel,
        );

  /// Returns a shallow copy of this [FlashlistPermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FlashlistPermission copyWith({
    Object? id = _Undefined,
    int? userId,
    int? flashlistId,
    String? accessLevel,
  }) {
    return FlashlistPermission(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      flashlistId: flashlistId ?? this.flashlistId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}
