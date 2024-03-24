/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../protocol.dart' as _i2;

abstract class AcceptInviteToFlashlist extends _i1.SerializableEntity {
  AcceptInviteToFlashlist._({
    required this.user,
    required this.flashlistId,
    required this.requestId,
    required this.accessLevel,
  });

  factory AcceptInviteToFlashlist({
    required _i2.AppUser user,
    required int flashlistId,
    required int requestId,
    required String accessLevel,
  }) = _AcceptInviteToFlashlistImpl;

  factory AcceptInviteToFlashlist.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AcceptInviteToFlashlist(
      user: serializationManager
          .deserialize<_i2.AppUser>(jsonSerialization['user']),
      flashlistId: serializationManager
          .deserialize<int>(jsonSerialization['flashlistId']),
      requestId:
          serializationManager.deserialize<int>(jsonSerialization['requestId']),
      accessLevel: serializationManager
          .deserialize<String>(jsonSerialization['accessLevel']),
    );
  }

  _i2.AppUser user;

  int flashlistId;

  int requestId;

  String accessLevel;

  AcceptInviteToFlashlist copyWith({
    _i2.AppUser? user,
    int? flashlistId,
    int? requestId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'flashlistId': flashlistId,
      'requestId': requestId,
      'accessLevel': accessLevel,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'user': user.allToJson(),
      'flashlistId': flashlistId,
      'requestId': requestId,
      'accessLevel': accessLevel,
    };
  }
}

class _AcceptInviteToFlashlistImpl extends AcceptInviteToFlashlist {
  _AcceptInviteToFlashlistImpl({
    required _i2.AppUser user,
    required int flashlistId,
    required int requestId,
    required String accessLevel,
  }) : super._(
          user: user,
          flashlistId: flashlistId,
          requestId: requestId,
          accessLevel: accessLevel,
        );

  @override
  AcceptInviteToFlashlist copyWith({
    _i2.AppUser? user,
    int? flashlistId,
    int? requestId,
    String? accessLevel,
  }) {
    return AcceptInviteToFlashlist(
      user: user ?? this.user.copyWith(),
      flashlistId: flashlistId ?? this.flashlistId,
      requestId: requestId ?? this.requestId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}
