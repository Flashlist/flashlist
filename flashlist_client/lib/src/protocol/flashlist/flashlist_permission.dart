/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class FlashlistPermission extends _i1.SerializableEntity {
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

  factory FlashlistPermission.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FlashlistPermission(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      flashlistId: serializationManager
          .deserialize<int>(jsonSerialization['flashlistId']),
      accessLevel: serializationManager
          .deserialize<String>(jsonSerialization['accessLevel']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int flashlistId;

  String accessLevel;

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
