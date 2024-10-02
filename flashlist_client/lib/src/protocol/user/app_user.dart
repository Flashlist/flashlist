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

abstract class AppUser implements _i1.SerializableModel {
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

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      imageSrc: jsonSerialization['imageSrc'] as String?,
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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
