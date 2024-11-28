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
import 'flashlist/flashlist.dart' as _i2;
import 'flashlist/flashlist_permission.dart' as _i3;
import 'flashlist/stream_messages/authors/accept_invite_to_flashlist.dart'
    as _i4;
import 'flashlist/stream_messages/authors/add_user_to_flashlist.dart' as _i5;
import 'flashlist/stream_messages/authors/invite_user_to_flashlist.dart' as _i6;
import 'flashlist/stream_messages/authors/join_flashlist.dart' as _i7;
import 'flashlist/stream_messages/authors/leave_flashlist.dart' as _i8;
import 'flashlist/stream_messages/authors/remove_user_from_flashlist.dart'
    as _i9;
import 'flashlist/stream_messages/crud/delete_flashlist.dart' as _i10;
import 'flashlist/stream_messages/crud/flashlist_batch.dart' as _i11;
import 'flashlist/stream_messages/crud/update_flashlist.dart' as _i12;
import 'flashlist_item/flashlist_item.dart' as _i13;
import 'flashlist_item/stream_messages/delete_flashlist_item.dart' as _i14;
import 'flashlist_item/stream_messages/insert_flashlist_item.dart' as _i15;
import 'flashlist_item/stream_messages/re_order_flashlist_item.dart' as _i16;
import 'user/app_user.dart' as _i17;
import 'user/notification.dart' as _i18;
import 'user/user_relation.dart' as _i19;
import 'user/user_request.dart' as _i20;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i21;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i22;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i23;
export 'flashlist/flashlist.dart';
export 'flashlist/flashlist_permission.dart';
export 'flashlist/stream_messages/authors/accept_invite_to_flashlist.dart';
export 'flashlist/stream_messages/authors/add_user_to_flashlist.dart';
export 'flashlist/stream_messages/authors/invite_user_to_flashlist.dart';
export 'flashlist/stream_messages/authors/join_flashlist.dart';
export 'flashlist/stream_messages/authors/leave_flashlist.dart';
export 'flashlist/stream_messages/authors/remove_user_from_flashlist.dart';
export 'flashlist/stream_messages/crud/delete_flashlist.dart';
export 'flashlist/stream_messages/crud/flashlist_batch.dart';
export 'flashlist/stream_messages/crud/update_flashlist.dart';
export 'flashlist_item/flashlist_item.dart';
export 'flashlist_item/stream_messages/delete_flashlist_item.dart';
export 'flashlist_item/stream_messages/insert_flashlist_item.dart';
export 'flashlist_item/stream_messages/re_order_flashlist_item.dart';
export 'user/app_user.dart';
export 'user/notification.dart';
export 'user/user_relation.dart';
export 'user/user_request.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Flashlist) {
      return _i2.Flashlist.fromJson(data) as T;
    }
    if (t == _i3.FlashlistPermission) {
      return _i3.FlashlistPermission.fromJson(data) as T;
    }
    if (t == _i4.AcceptInviteToFlashlist) {
      return _i4.AcceptInviteToFlashlist.fromJson(data) as T;
    }
    if (t == _i5.AddUserToFlashlist) {
      return _i5.AddUserToFlashlist.fromJson(data) as T;
    }
    if (t == _i6.InviteUserToFlashlist) {
      return _i6.InviteUserToFlashlist.fromJson(data) as T;
    }
    if (t == _i7.JoinFlashlist) {
      return _i7.JoinFlashlist.fromJson(data) as T;
    }
    if (t == _i8.LeaveFlashlist) {
      return _i8.LeaveFlashlist.fromJson(data) as T;
    }
    if (t == _i9.RemoveUserFromFlashlist) {
      return _i9.RemoveUserFromFlashlist.fromJson(data) as T;
    }
    if (t == _i10.DeleteFlashlist) {
      return _i10.DeleteFlashlist.fromJson(data) as T;
    }
    if (t == _i11.FlashlistBatch) {
      return _i11.FlashlistBatch.fromJson(data) as T;
    }
    if (t == _i12.UpdateFlashlist) {
      return _i12.UpdateFlashlist.fromJson(data) as T;
    }
    if (t == _i13.FlashlistItem) {
      return _i13.FlashlistItem.fromJson(data) as T;
    }
    if (t == _i14.DeleteFlashlistItem) {
      return _i14.DeleteFlashlistItem.fromJson(data) as T;
    }
    if (t == _i15.InsertFlashlistItem) {
      return _i15.InsertFlashlistItem.fromJson(data) as T;
    }
    if (t == _i16.ReOrderFlashlistItem) {
      return _i16.ReOrderFlashlistItem.fromJson(data) as T;
    }
    if (t == _i17.AppUser) {
      return _i17.AppUser.fromJson(data) as T;
    }
    if (t == _i18.Notification) {
      return _i18.Notification.fromJson(data) as T;
    }
    if (t == _i19.UserRelation) {
      return _i19.UserRelation.fromJson(data) as T;
    }
    if (t == _i20.UserRequest) {
      return _i20.UserRequest.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Flashlist?>()) {
      return (data != null ? _i2.Flashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.FlashlistPermission?>()) {
      return (data != null ? _i3.FlashlistPermission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.AcceptInviteToFlashlist?>()) {
      return (data != null ? _i4.AcceptInviteToFlashlist.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.AddUserToFlashlist?>()) {
      return (data != null ? _i5.AddUserToFlashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.InviteUserToFlashlist?>()) {
      return (data != null ? _i6.InviteUserToFlashlist.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.JoinFlashlist?>()) {
      return (data != null ? _i7.JoinFlashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LeaveFlashlist?>()) {
      return (data != null ? _i8.LeaveFlashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RemoveUserFromFlashlist?>()) {
      return (data != null ? _i9.RemoveUserFromFlashlist.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.DeleteFlashlist?>()) {
      return (data != null ? _i10.DeleteFlashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.FlashlistBatch?>()) {
      return (data != null ? _i11.FlashlistBatch.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UpdateFlashlist?>()) {
      return (data != null ? _i12.UpdateFlashlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.FlashlistItem?>()) {
      return (data != null ? _i13.FlashlistItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DeleteFlashlistItem?>()) {
      return (data != null ? _i14.DeleteFlashlistItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.InsertFlashlistItem?>()) {
      return (data != null ? _i15.InsertFlashlistItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.ReOrderFlashlistItem?>()) {
      return (data != null ? _i16.ReOrderFlashlistItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.AppUser?>()) {
      return (data != null ? _i17.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Notification?>()) {
      return (data != null ? _i18.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.UserRelation?>()) {
      return (data != null ? _i19.UserRelation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UserRequest?>()) {
      return (data != null ? _i20.UserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i13.FlashlistItem?>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.FlashlistItem?>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i17.AppUser?>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i17.AppUser?>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i2.Flashlist>) {
      return (data as List).map((e) => deserialize<_i2.Flashlist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i21.UserRequest?>) {
      return (data as List)
          .map((e) => deserialize<_i21.UserRequest?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i22.AppUser>) {
      return (data as List).map((e) => deserialize<_i22.AppUser>(e)).toList()
          as dynamic;
    }
    try {
      return _i23.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
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
    if (data is _i8.LeaveFlashlist) {
      return 'LeaveFlashlist';
    }
    if (data is _i9.RemoveUserFromFlashlist) {
      return 'RemoveUserFromFlashlist';
    }
    if (data is _i10.DeleteFlashlist) {
      return 'DeleteFlashlist';
    }
    if (data is _i11.FlashlistBatch) {
      return 'FlashlistBatch';
    }
    if (data is _i12.UpdateFlashlist) {
      return 'UpdateFlashlist';
    }
    if (data is _i13.FlashlistItem) {
      return 'FlashlistItem';
    }
    if (data is _i14.DeleteFlashlistItem) {
      return 'DeleteFlashlistItem';
    }
    if (data is _i15.InsertFlashlistItem) {
      return 'InsertFlashlistItem';
    }
    if (data is _i16.ReOrderFlashlistItem) {
      return 'ReOrderFlashlistItem';
    }
    if (data is _i17.AppUser) {
      return 'AppUser';
    }
    if (data is _i18.Notification) {
      return 'Notification';
    }
    if (data is _i19.UserRelation) {
      return 'UserRelation';
    }
    if (data is _i20.UserRequest) {
      return 'UserRequest';
    }
    className = _i23.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Flashlist') {
      return deserialize<_i2.Flashlist>(data['data']);
    }
    if (dataClassName == 'FlashlistPermission') {
      return deserialize<_i3.FlashlistPermission>(data['data']);
    }
    if (dataClassName == 'AcceptInviteToFlashlist') {
      return deserialize<_i4.AcceptInviteToFlashlist>(data['data']);
    }
    if (dataClassName == 'AddUserToFlashlist') {
      return deserialize<_i5.AddUserToFlashlist>(data['data']);
    }
    if (dataClassName == 'InviteUserToFlashlist') {
      return deserialize<_i6.InviteUserToFlashlist>(data['data']);
    }
    if (dataClassName == 'JoinFlashlist') {
      return deserialize<_i7.JoinFlashlist>(data['data']);
    }
    if (dataClassName == 'LeaveFlashlist') {
      return deserialize<_i8.LeaveFlashlist>(data['data']);
    }
    if (dataClassName == 'RemoveUserFromFlashlist') {
      return deserialize<_i9.RemoveUserFromFlashlist>(data['data']);
    }
    if (dataClassName == 'DeleteFlashlist') {
      return deserialize<_i10.DeleteFlashlist>(data['data']);
    }
    if (dataClassName == 'FlashlistBatch') {
      return deserialize<_i11.FlashlistBatch>(data['data']);
    }
    if (dataClassName == 'UpdateFlashlist') {
      return deserialize<_i12.UpdateFlashlist>(data['data']);
    }
    if (dataClassName == 'FlashlistItem') {
      return deserialize<_i13.FlashlistItem>(data['data']);
    }
    if (dataClassName == 'DeleteFlashlistItem') {
      return deserialize<_i14.DeleteFlashlistItem>(data['data']);
    }
    if (dataClassName == 'InsertFlashlistItem') {
      return deserialize<_i15.InsertFlashlistItem>(data['data']);
    }
    if (dataClassName == 'ReOrderFlashlistItem') {
      return deserialize<_i16.ReOrderFlashlistItem>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i17.AppUser>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i18.Notification>(data['data']);
    }
    if (dataClassName == 'UserRelation') {
      return deserialize<_i19.UserRelation>(data['data']);
    }
    if (dataClassName == 'UserRequest') {
      return deserialize<_i20.UserRequest>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i23.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
