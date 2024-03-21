/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'flashlist/flashlist.dart' as _i2;
import 'flashlist/flashlist_permission.dart' as _i3;
import 'flashlist/stream_messages/delete_flashlist.dart' as _i4;
import 'flashlist/stream_messages/flashlist_batch.dart' as _i5;
import 'flashlist/stream_messages/update_flashlist.dart' as _i6;
import 'flashlist_item/flashlist_item.dart' as _i7;
import 'flashlist_item/stream_messages/delete_flashlist_item.dart' as _i8;
import 'flashlist_item/stream_messages/re_order_flashlist_item.dart' as _i9;
import 'user/app_user.dart' as _i10;
import 'user/notification.dart' as _i11;
import 'user/user_relation.dart' as _i12;
import 'user/user_request.dart' as _i13;
import 'protocol.dart' as _i14;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i15;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i16;
import 'package:flashlist_client/src/protocol/flashlist/flashlist.dart' as _i17;
import 'package:serverpod_auth_client/module.dart' as _i18;
export 'flashlist/flashlist.dart';
export 'flashlist/flashlist_permission.dart';
export 'flashlist/stream_messages/delete_flashlist.dart';
export 'flashlist/stream_messages/flashlist_batch.dart';
export 'flashlist/stream_messages/update_flashlist.dart';
export 'flashlist_item/flashlist_item.dart';
export 'flashlist_item/stream_messages/delete_flashlist_item.dart';
export 'flashlist_item/stream_messages/re_order_flashlist_item.dart';
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
    if (t == _i2.Flashlist) {
      return _i2.Flashlist.fromJson(data, this) as T;
    }
    if (t == _i3.FlashlistPermission) {
      return _i3.FlashlistPermission.fromJson(data, this) as T;
    }
    if (t == _i4.DeleteFlashlist) {
      return _i4.DeleteFlashlist.fromJson(data, this) as T;
    }
    if (t == _i5.FlashlistBatch) {
      return _i5.FlashlistBatch.fromJson(data, this) as T;
    }
    if (t == _i6.UpdateFlashlist) {
      return _i6.UpdateFlashlist.fromJson(data, this) as T;
    }
    if (t == _i7.FlashlistItem) {
      return _i7.FlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i8.DeleteFlashlistItem) {
      return _i8.DeleteFlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i9.ReOrderFlashlistItem) {
      return _i9.ReOrderFlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i10.AppUser) {
      return _i10.AppUser.fromJson(data, this) as T;
    }
    if (t == _i11.Notification) {
      return _i11.Notification.fromJson(data, this) as T;
    }
    if (t == _i12.UserRelation) {
      return _i12.UserRelation.fromJson(data, this) as T;
    }
    if (t == _i13.UserRequest) {
      return _i13.UserRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Flashlist?>()) {
      return (data != null ? _i2.Flashlist.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.FlashlistPermission?>()) {
      return (data != null
          ? _i3.FlashlistPermission.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.DeleteFlashlist?>()) {
      return (data != null ? _i4.DeleteFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.FlashlistBatch?>()) {
      return (data != null ? _i5.FlashlistBatch.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.UpdateFlashlist?>()) {
      return (data != null ? _i6.UpdateFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.FlashlistItem?>()) {
      return (data != null ? _i7.FlashlistItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.DeleteFlashlistItem?>()) {
      return (data != null
          ? _i8.DeleteFlashlistItem.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i9.ReOrderFlashlistItem?>()) {
      return (data != null
          ? _i9.ReOrderFlashlistItem.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i10.AppUser?>()) {
      return (data != null ? _i10.AppUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.Notification?>()) {
      return (data != null ? _i11.Notification.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.UserRelation?>()) {
      return (data != null ? _i12.UserRelation.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i13.UserRequest?>()) {
      return (data != null ? _i13.UserRequest.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i14.FlashlistItem?>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i14.FlashlistItem?>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i14.Flashlist>) {
      return (data as List).map((e) => deserialize<_i14.Flashlist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.UserRequest?>) {
      return (data as List)
          .map((e) => deserialize<_i15.UserRequest?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i16.AppUser>) {
      return (data as List).map((e) => deserialize<_i16.AppUser>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.Flashlist>) {
      return (data as List).map((e) => deserialize<_i17.Flashlist>(e)).toList()
          as dynamic;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Flashlist) {
      return 'Flashlist';
    }
    if (data is _i3.FlashlistPermission) {
      return 'FlashlistPermission';
    }
    if (data is _i4.DeleteFlashlist) {
      return 'DeleteFlashlist';
    }
    if (data is _i5.FlashlistBatch) {
      return 'FlashlistBatch';
    }
    if (data is _i6.UpdateFlashlist) {
      return 'UpdateFlashlist';
    }
    if (data is _i7.FlashlistItem) {
      return 'FlashlistItem';
    }
    if (data is _i8.DeleteFlashlistItem) {
      return 'DeleteFlashlistItem';
    }
    if (data is _i9.ReOrderFlashlistItem) {
      return 'ReOrderFlashlistItem';
    }
    if (data is _i10.AppUser) {
      return 'AppUser';
    }
    if (data is _i11.Notification) {
      return 'Notification';
    }
    if (data is _i12.UserRelation) {
      return 'UserRelation';
    }
    if (data is _i13.UserRequest) {
      return 'UserRequest';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i18.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Flashlist') {
      return deserialize<_i2.Flashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistPermission') {
      return deserialize<_i3.FlashlistPermission>(data['data']);
    }
    if (data['className'] == 'DeleteFlashlist') {
      return deserialize<_i4.DeleteFlashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistBatch') {
      return deserialize<_i5.FlashlistBatch>(data['data']);
    }
    if (data['className'] == 'UpdateFlashlist') {
      return deserialize<_i6.UpdateFlashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistItem') {
      return deserialize<_i7.FlashlistItem>(data['data']);
    }
    if (data['className'] == 'DeleteFlashlistItem') {
      return deserialize<_i8.DeleteFlashlistItem>(data['data']);
    }
    if (data['className'] == 'ReOrderFlashlistItem') {
      return deserialize<_i9.ReOrderFlashlistItem>(data['data']);
    }
    if (data['className'] == 'AppUser') {
      return deserialize<_i10.AppUser>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i11.Notification>(data['data']);
    }
    if (data['className'] == 'UserRelation') {
      return deserialize<_i12.UserRelation>(data['data']);
    }
    if (data['className'] == 'UserRequest') {
      return deserialize<_i13.UserRequest>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
