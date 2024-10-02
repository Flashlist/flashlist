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

abstract class InviteUserToFlashlist
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
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
      Map<String, dynamic> jsonSerialization) {
    return InviteUserToFlashlist(
      userId: jsonSerialization['userId'] as int?,
      email: jsonSerialization['email'] as String,
      flashlistId: jsonSerialization['flashlistId'] as int,
      accessLevel: jsonSerialization['accessLevel'] as String,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (userId != null) 'userId': userId,
      'email': email,
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
