/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user/app_user.dart' as _i2;
import 'user/notification.dart' as _i3;
import 'user/user_relation.dart' as _i4;
import 'user/user_request.dart' as _i5;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i6;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i7;
import 'package:serverpod_auth_client/module.dart' as _i8;
export 'user/app_user.dart';
export 'user/notification.dart';
export 'user/user_relation.dart';
export 'user/user_request.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.AppUser) {
      return _i2.AppUser.fromJson(data, this) as T;
    }
    if (t == _i3.Notification) {
      return _i3.Notification.fromJson(data, this) as T;
    }
    if (t == _i4.UserRelation) {
      return _i4.UserRelation.fromJson(data, this) as T;
    }
    if (t == _i5.UserRequest) {
      return _i5.UserRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.AppUser?>()) {
      return (data != null ? _i2.AppUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Notification?>()) {
      return (data != null ? _i3.Notification.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.UserRelation?>()) {
      return (data != null ? _i4.UserRelation.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.UserRequest?>()) {
      return (data != null ? _i5.UserRequest.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.UserRequest?>) {
      return (data as List)
          .map((e) => deserialize<_i6.UserRequest?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i7.AppUser>) {
      return (data as List).map((e) => deserialize<_i7.AppUser>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.AppUser) {
      return 'AppUser';
    }
    if (data is _i3.Notification) {
      return 'Notification';
    }
    if (data is _i4.UserRelation) {
      return 'UserRelation';
    }
    if (data is _i5.UserRequest) {
      return 'UserRequest';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'AppUser') {
      return deserialize<_i2.AppUser>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i3.Notification>(data['data']);
    }
    if (data['className'] == 'UserRelation') {
      return deserialize<_i4.UserRelation>(data['data']);
    }
    if (data['className'] == 'UserRequest') {
      return deserialize<_i5.UserRequest>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
