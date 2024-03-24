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
import 'flashlist/stream_messages/authors/accept_invite_to_flashlist.dart'
    as _i4;
import 'flashlist/stream_messages/authors/add_user_to_flashlist.dart' as _i5;
import 'flashlist/stream_messages/authors/invite_user_to_flashlist.dart' as _i6;
import 'flashlist/stream_messages/authors/join_flashlist.dart' as _i7;
import 'flashlist/stream_messages/crud/delete_flashlist.dart' as _i8;
import 'flashlist/stream_messages/crud/flashlist_batch.dart' as _i9;
import 'flashlist/stream_messages/crud/update_flashlist.dart' as _i10;
import 'flashlist_item/flashlist_item.dart' as _i11;
import 'flashlist_item/stream_messages/delete_flashlist_item.dart' as _i12;
import 'flashlist_item/stream_messages/re_order_flashlist_item.dart' as _i13;
import 'user/app_user.dart' as _i14;
import 'user/notification.dart' as _i15;
import 'user/user_relation.dart' as _i16;
import 'user/user_request.dart' as _i17;
import 'protocol.dart' as _i18;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i19;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i20;
import 'package:serverpod_auth_client/module.dart' as _i21;
export 'flashlist/flashlist.dart';
export 'flashlist/flashlist_permission.dart';
export 'flashlist/stream_messages/authors/accept_invite_to_flashlist.dart';
export 'flashlist/stream_messages/authors/add_user_to_flashlist.dart';
export 'flashlist/stream_messages/authors/invite_user_to_flashlist.dart';
export 'flashlist/stream_messages/authors/join_flashlist.dart';
export 'flashlist/stream_messages/crud/delete_flashlist.dart';
export 'flashlist/stream_messages/crud/flashlist_batch.dart';
export 'flashlist/stream_messages/crud/update_flashlist.dart';
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
    if (t == _i4.AcceptInviteToFlashlist) {
      return _i4.AcceptInviteToFlashlist.fromJson(data, this) as T;
    }
    if (t == _i5.AddUserToFlashlist) {
      return _i5.AddUserToFlashlist.fromJson(data, this) as T;
    }
    if (t == _i6.InviteUserToFlashlist) {
      return _i6.InviteUserToFlashlist.fromJson(data, this) as T;
    }
    if (t == _i7.JoinFlashlist) {
      return _i7.JoinFlashlist.fromJson(data, this) as T;
    }
    if (t == _i8.DeleteFlashlist) {
      return _i8.DeleteFlashlist.fromJson(data, this) as T;
    }
    if (t == _i9.FlashlistBatch) {
      return _i9.FlashlistBatch.fromJson(data, this) as T;
    }
    if (t == _i10.UpdateFlashlist) {
      return _i10.UpdateFlashlist.fromJson(data, this) as T;
    }
    if (t == _i11.FlashlistItem) {
      return _i11.FlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i12.DeleteFlashlistItem) {
      return _i12.DeleteFlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i13.ReOrderFlashlistItem) {
      return _i13.ReOrderFlashlistItem.fromJson(data, this) as T;
    }
    if (t == _i14.AppUser) {
      return _i14.AppUser.fromJson(data, this) as T;
    }
    if (t == _i15.Notification) {
      return _i15.Notification.fromJson(data, this) as T;
    }
    if (t == _i16.UserRelation) {
      return _i16.UserRelation.fromJson(data, this) as T;
    }
    if (t == _i17.UserRequest) {
      return _i17.UserRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Flashlist?>()) {
      return (data != null ? _i2.Flashlist.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.FlashlistPermission?>()) {
      return (data != null
          ? _i3.FlashlistPermission.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.AcceptInviteToFlashlist?>()) {
      return (data != null
          ? _i4.AcceptInviteToFlashlist.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i5.AddUserToFlashlist?>()) {
      return (data != null ? _i5.AddUserToFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.InviteUserToFlashlist?>()) {
      return (data != null
          ? _i6.InviteUserToFlashlist.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.JoinFlashlist?>()) {
      return (data != null ? _i7.JoinFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.DeleteFlashlist?>()) {
      return (data != null ? _i8.DeleteFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.FlashlistBatch?>()) {
      return (data != null ? _i9.FlashlistBatch.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.UpdateFlashlist?>()) {
      return (data != null ? _i10.UpdateFlashlist.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.FlashlistItem?>()) {
      return (data != null ? _i11.FlashlistItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.DeleteFlashlistItem?>()) {
      return (data != null
          ? _i12.DeleteFlashlistItem.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i13.ReOrderFlashlistItem?>()) {
      return (data != null
          ? _i13.ReOrderFlashlistItem.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i14.AppUser?>()) {
      return (data != null ? _i14.AppUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i15.Notification?>()) {
      return (data != null ? _i15.Notification.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.UserRelation?>()) {
      return (data != null ? _i16.UserRelation.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i17.UserRequest?>()) {
      return (data != null ? _i17.UserRequest.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i18.FlashlistItem?>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i18.FlashlistItem?>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i18.AppUser?>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.AppUser?>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i18.Flashlist>) {
      return (data as List).map((e) => deserialize<_i18.Flashlist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.UserRequest?>) {
      return (data as List)
          .map((e) => deserialize<_i19.UserRequest?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i20.AppUser>) {
      return (data as List).map((e) => deserialize<_i20.AppUser>(e)).toList()
          as dynamic;
    }
    try {
      return _i21.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i21.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Flashlist) {
      return 'Flashlist';
    }
    if (data is _i3.FlashlistPermission) {
      return 'FlashlistPermission';
    }
    if (data is _i4.AcceptInviteToFlashlist) {
      return 'AcceptInviteToFlashlist';
    }
    if (data is _i5.AddUserToFlashlist) {
      return 'AddUserToFlashlist';
    }
    if (data is _i6.InviteUserToFlashlist) {
      return 'InviteUserToFlashlist';
    }
    if (data is _i7.JoinFlashlist) {
      return 'JoinFlashlist';
    }
    if (data is _i8.DeleteFlashlist) {
      return 'DeleteFlashlist';
    }
    if (data is _i9.FlashlistBatch) {
      return 'FlashlistBatch';
    }
    if (data is _i10.UpdateFlashlist) {
      return 'UpdateFlashlist';
    }
    if (data is _i11.FlashlistItem) {
      return 'FlashlistItem';
    }
    if (data is _i12.DeleteFlashlistItem) {
      return 'DeleteFlashlistItem';
    }
    if (data is _i13.ReOrderFlashlistItem) {
      return 'ReOrderFlashlistItem';
    }
    if (data is _i14.AppUser) {
      return 'AppUser';
    }
    if (data is _i15.Notification) {
      return 'Notification';
    }
    if (data is _i16.UserRelation) {
      return 'UserRelation';
    }
    if (data is _i17.UserRequest) {
      return 'UserRequest';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i21.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Flashlist') {
      return deserialize<_i2.Flashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistPermission') {
      return deserialize<_i3.FlashlistPermission>(data['data']);
    }
    if (data['className'] == 'AcceptInviteToFlashlist') {
      return deserialize<_i4.AcceptInviteToFlashlist>(data['data']);
    }
    if (data['className'] == 'AddUserToFlashlist') {
      return deserialize<_i5.AddUserToFlashlist>(data['data']);
    }
    if (data['className'] == 'InviteUserToFlashlist') {
      return deserialize<_i6.InviteUserToFlashlist>(data['data']);
    }
    if (data['className'] == 'JoinFlashlist') {
      return deserialize<_i7.JoinFlashlist>(data['data']);
    }
    if (data['className'] == 'DeleteFlashlist') {
      return deserialize<_i8.DeleteFlashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistBatch') {
      return deserialize<_i9.FlashlistBatch>(data['data']);
    }
    if (data['className'] == 'UpdateFlashlist') {
      return deserialize<_i10.UpdateFlashlist>(data['data']);
    }
    if (data['className'] == 'FlashlistItem') {
      return deserialize<_i11.FlashlistItem>(data['data']);
    }
    if (data['className'] == 'DeleteFlashlistItem') {
      return deserialize<_i12.DeleteFlashlistItem>(data['data']);
    }
    if (data['className'] == 'ReOrderFlashlistItem') {
      return deserialize<_i13.ReOrderFlashlistItem>(data['data']);
    }
    if (data['className'] == 'AppUser') {
      return deserialize<_i14.AppUser>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i15.Notification>(data['data']);
    }
    if (data['className'] == 'UserRelation') {
      return deserialize<_i16.UserRelation>(data['data']);
    }
    if (data['className'] == 'UserRequest') {
      return deserialize<_i17.UserRequest>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
