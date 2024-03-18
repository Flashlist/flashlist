/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'flashlist/crud_messages/delete_flashlist.dart' as _i2;
import 'flashlist/crud_messages/flashlist_batch.dart' as _i3;
import 'flashlist/flashlist.dart' as _i4;
import 'flashlist/flashlist_permission.dart' as _i5;
import 'flashlist_item/flashlist_item.dart' as _i6;
import 'user/app_user.dart' as _i7;
import 'user/notification.dart' as _i8;
import 'user/user_relation.dart' as _i9;
import 'user/user_request.dart' as _i10;
import 'protocol.dart' as _i11;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i12;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i13;
import 'package:flashlist_client/src/protocol/flashlist/flashlist.dart' as _i14;
import 'package:serverpod_auth_client/module.dart' as _i15;
export 'flashlist/crud_messages/delete_flashlist.dart';
export 'flashlist/crud_messages/flashlist_batch.dart';
export 'flashlist/flashlist.dart';
export 'flashlist/flashlist_permission.dart';
export 'flashlist_item/flashlist_item.dart';
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
    if (t == _i2.DeleteFlashlist) {
      return _i2.DeleteFlashlist.fromJson(data, this) as T;
    }
    if (t == _i3.FlashlistBatch) {
      return _i3.FlashlistBatch.fromJson(data, this) as T;
    }
    if (t == _i4.Flashlist) {
      return _i4.Flashlist.fromJson(data, this) as T;
    }
    if (t == _i5.FlashlistPermission) {
      return _i5.FlashlistPermission.fromJson(data, this) as T;
    }
    if (t == _i6.FlashlistItem) {
      return _i6.FlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i7.AppUser) {
      return _i7.AppUser.fromJson(data, this) as T;
    }
    if (t == _i8.Notification) {
      return _i8.Notification.fromJson(data, this) as T;
    }
    if (t == _i9.UserRelation) {
      return _i9.UserRelation.fromJson(data, this) as T;
    }
    if (t == _i10.UserRequest) {
      return _i10.UserRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.DeleteFlashlist?>()) {
      return (data != null ? _i2.DeleteFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.FlashlistBatch?>()) {
      return (data != null ? _i3.FlashlistBatch.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Flashlist?>()) {
      return (data != null ? _i4.Flashlist.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.FlashlistPermission?>()) {
      return (data != null
          ? _i5.FlashlistPermission.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.FlashlistItem?>()) {
      return (data != null ? _i6.FlashlistItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.AppUser?>()) {
      return (data != null ? _i7.AppUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Notification?>()) {
      return (data != null ? _i8.Notification.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.UserRelation?>()) {
      return (data != null ? _i9.UserRelation.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.UserRequest?>()) {
      return (data != null ? _i10.UserRequest.fromJson(data, this) : null) as T;
    }
    if (t == List<_i11.Flashlist>) {
      return (data as List).map((e) => deserialize<_i11.Flashlist>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i11.FlashlistItem?>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.FlashlistItem?>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i12.UserRequest?>) {
      return (data as List)
          .map((e) => deserialize<_i12.UserRequest?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i13.AppUser>) {
      return (data as List).map((e) => deserialize<_i13.AppUser>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Flashlist>) {
      return (data as List).map((e) => deserialize<_i14.Flashlist>(e)).toList()
          as dynamic;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.DeleteFlashlist) {
      return 'DeleteFlashlist';
    }
    if (data is _i3.FlashlistBatch) {
      return 'FlashlistBatch';
    }
    if (data is _i4.Flashlist) {
      return 'Flashlist';
    }
    if (data is _i5.FlashlistPermission) {
      return 'FlashlistPermission';
    }
    if (data is _i6.FlashlistItem) {
      return 'FlashlistItem';
    }
    if (data is _i7.AppUser) {
      return 'AppUser';
    }
    if (data is _i8.Notification) {
      return 'Notification';
    }
    if (data is _i9.UserRelation) {
      return 'UserRelation';
    }
    if (data is _i10.UserRequest) {
      return 'UserRequest';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'DeleteFlashlist') {
      return deserialize<_i2.DeleteFlashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistBatch') {
      return deserialize<_i3.FlashlistBatch>(data['data']);
    }
    if (data['className'] == 'Flashlist') {
      return deserialize<_i4.Flashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistPermission') {
      return deserialize<_i5.FlashlistPermission>(data['data']);
    }
    if (data['className'] == 'FlashlistItem') {
      return deserialize<_i6.FlashlistItem>(data['data']);
    }
    if (data['className'] == 'AppUser') {
      return deserialize<_i7.AppUser>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i8.Notification>(data['data']);
    }
    if (data['className'] == 'UserRelation') {
      return deserialize<_i9.UserRelation>(data['data']);
    }
    if (data['className'] == 'UserRequest') {
      return deserialize<_i10.UserRequest>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
