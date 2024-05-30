/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class LeaveFlashlist implements _i1.SerializableModel {
  LeaveFlashlist._({
    required this.userId,
    required this.flashlistId,
  });

  factory LeaveFlashlist({
    required int userId,
    required int flashlistId,
  }) = _LeaveFlashlistImpl;

  factory LeaveFlashlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return LeaveFlashlist(
      userId: jsonSerialization['userId'] as int,
      flashlistId: jsonSerialization['flashlistId'] as int,
    );
  }

  int userId;

  int flashlistId;

  LeaveFlashlist copyWith({
    int? userId,
    int? flashlistId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'flashlistId': flashlistId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LeaveFlashlistImpl extends LeaveFlashlist {
  _LeaveFlashlistImpl({
    required int userId,
    required int flashlistId,
  }) : super._(
          userId: userId,
          flashlistId: flashlistId,
        );

  @override
  LeaveFlashlist copyWith({
    int? userId,
    int? flashlistId,
  }) {
    return LeaveFlashlist(
      userId: userId ?? this.userId,
      flashlistId: flashlistId ?? this.flashlistId,
    );
  }
}
