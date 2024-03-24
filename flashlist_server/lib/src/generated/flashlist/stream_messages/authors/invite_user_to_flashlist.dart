/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class InviteUserToFlashlist extends _i1.SerializableEntity {
  InviteUserToFlashlist._({
    this.userId,
    required this.email,
    required this.flashlistId,
    required this.accessLevel,
  });

  factory InviteUserToFlashlist({
    int? userId,
    required String email,
    required int flashlistId,
    required String accessLevel,
  }) = _InviteUserToFlashlistImpl;

  factory InviteUserToFlashlist.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return InviteUserToFlashlist(
      userId:
          serializationManager.deserialize<int?>(jsonSerialization['userId']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      flashlistId: serializationManager
          .deserialize<int>(jsonSerialization['flashlistId']),
      accessLevel: serializationManager
          .deserialize<String>(jsonSerialization['accessLevel']),
    );
  }

  int? userId;

  String email;

  int flashlistId;

  String accessLevel;

  InviteUserToFlashlist copyWith({
    int? userId,
    String? email,
    int? flashlistId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      'email': email,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (userId != null) 'userId': userId,
      'email': email,
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }
}

class _Undefined {}

class _InviteUserToFlashlistImpl extends InviteUserToFlashlist {
  _InviteUserToFlashlistImpl({
    int? userId,
    required String email,
    required int flashlistId,
    required String accessLevel,
  }) : super._(
          userId: userId,
          email: email,
          flashlistId: flashlistId,
          accessLevel: accessLevel,
        );

  @override
  InviteUserToFlashlist copyWith({
    Object? userId = _Undefined,
    String? email,
    int? flashlistId,
    String? accessLevel,
  }) {
    return InviteUserToFlashlist(
      userId: userId is int? ? userId : this.userId,
      email: email ?? this.email,
      flashlistId: flashlistId ?? this.flashlistId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}
