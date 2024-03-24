/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../protocol.dart' as _i2;

abstract class AddUserToFlashlist extends _i1.SerializableEntity {
  AddUserToFlashlist._({
    required this.user,
    required this.flashlistId,
    required this.accessLevel,
  });

  factory AddUserToFlashlist({
    required _i2.AppUser user,
    required int flashlistId,
    required String accessLevel,
  }) = _AddUserToFlashlistImpl;

  factory AddUserToFlashlist.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AddUserToFlashlist(
      user: serializationManager
          .deserialize<_i2.AppUser>(jsonSerialization['user']),
      flashlistId: serializationManager
          .deserialize<int>(jsonSerialization['flashlistId']),
      accessLevel: serializationManager
          .deserialize<String>(jsonSerialization['accessLevel']),
    );
  }

  _i2.AppUser user;

  int flashlistId;

  String accessLevel;

  AddUserToFlashlist copyWith({
    _i2.AppUser? user,
    int? flashlistId,
    String? accessLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'flashlistId': flashlistId,
      'accessLevel': accessLevel,
    };
  }
}

class _AddUserToFlashlistImpl extends AddUserToFlashlist {
  _AddUserToFlashlistImpl({
    required _i2.AppUser user,
    required int flashlistId,
    required String accessLevel,
  }) : super._(
          user: user,
          flashlistId: flashlistId,
          accessLevel: accessLevel,
        );

  @override
  AddUserToFlashlist copyWith({
    _i2.AppUser? user,
    int? flashlistId,
    String? accessLevel,
  }) {
    return AddUserToFlashlist(
      user: user ?? this.user.copyWith(),
      flashlistId: flashlistId ?? this.flashlistId,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }
}
