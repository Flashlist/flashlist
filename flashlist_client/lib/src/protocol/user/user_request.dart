/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class UserRequest extends _i1.SerializableEntity {
  UserRequest._({
    this.id,
    required this.userId1,
    required this.userId2,
    required this.type,
    this.data,
    required this.timestamp,
  });

  factory UserRequest({
    int? id,
    required int userId1,
    required int userId2,
    required String type,
    String? data,
    required DateTime timestamp,
  }) = _UserRequestImpl;

  factory UserRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId1:
          serializationManager.deserialize<int>(jsonSerialization['userId1']),
      userId2:
          serializationManager.deserialize<int>(jsonSerialization['userId2']),
      type: serializationManager.deserialize<String>(jsonSerialization['type']),
      data:
          serializationManager.deserialize<String?>(jsonSerialization['data']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId1;

  int userId2;

  String type;

  String? data;

  DateTime timestamp;

  UserRequest copyWith({
    int? id,
    int? userId1,
    int? userId2,
    String? type,
    String? data,
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
}

class _Undefined {}

class _UserRequestImpl extends UserRequest {
  _UserRequestImpl({
    int? id,
    required int userId1,
    required int userId2,
    required String type,
    String? data,
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
      data: data is String? ? data : this.data,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}