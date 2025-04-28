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

abstract class AcceptInviteToFlashlist
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AcceptInviteToFlashlist._({
    required this.userId,
    required this.flashlistId,
    required this.requestId,
    required this.accessLevel,
  });

  factory AcceptInviteToFlashlist({
    required int userId,
    required int flashlistId,
    required int requestId,
    required String accessLevel,
  }) = _AcceptInviteToFlashlistImpl;

  factory AcceptInviteToFlashlist.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return AcceptInviteToFlashlist(
      userId: jsonSerialization['userId'] as int,
      flashlistId: jsonSerialization['flashlistId'] as int,
      requestId: jsonSerialization['requestId'] as int,
      accessLevel: jsonSerialization['accessLevel'] as String,
    );
  }

  int userId;

  int flashlistId;

  int requestId;

  String accessLevel;

  /// Returns a shallow copy of this [AcceptInviteToFlashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AcceptInviteToFlashlist copyWith({
    int? userId,
    int? flashlistId,
    int? requestId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'flashlistId': flashlistId,
      'requestId': requestId,
      'accessLevel': accessLevel,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId,
      'flashlistId': flashlistId,
      'requestId': requestId,
      'accessLevel': accessLevel,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AcceptInviteToFlashlistImpl extends AcceptInviteToFlashlist {
  _AcceptInviteToFlashlistImpl({
    required int userId,
    required int flashlistId,
    required int requestId,
    required String accessLevel,
  }) : super._(
          userId: userId,
          flashlistId: flashlistId,
          requestId: requestId,
          accessLevel: accessLevel,
        );

  /// Returns a shallow copy of this [AcceptInviteToFlashlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AcceptInviteToFlashlist copyWith({
    int? userId,
    int? flashlistId,
    int? requestId,
    String? accessLevel,
  }) {
    return AcceptInviteToFlashlist(
      userId: userId ?? this.userId,
      flashlistId: flashlistId ?? this.flashlistId,
      requestId: requestId ?? this.requestId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}
