/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AppUser extends _i1.SerializableEntity {
  AppUser._({
    this.id,
    required this.userId,
    required this.username,
    required this.email,
    this.imageSrc,
  });

  factory AppUser({
    int? id,
    required int userId,
    required String username,
    required String email,
    String? imageSrc,
  }) = _AppUserImpl;

  factory AppUser.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AppUser(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      imageSrc: serializationManager
          .deserialize<String?>(jsonSerialization['imageSrc']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String username;

  String email;

  String? imageSrc;

  AppUser copyWith({
    int? id,
    int? userId,
    String? username,
    String? email,
    String? imageSrc,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'username': username,
      'email': email,
      if (imageSrc != null) 'imageSrc': imageSrc,
    };
  }
}

class _Undefined {}

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    int? id,
    required int userId,
    required String username,
    required String email,
    String? imageSrc,
  }) : super._(
          id: id,
          userId: userId,
          username: username,
          email: email,
          imageSrc: imageSrc,
        );

  @override
  AppUser copyWith({
    Object? id = _Undefined,
    int? userId,
    String? username,
    String? email,
    Object? imageSrc = _Undefined,
  }) {
    return AppUser(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      imageSrc: imageSrc is String? ? imageSrc : this.imageSrc,
    );
  }
}
