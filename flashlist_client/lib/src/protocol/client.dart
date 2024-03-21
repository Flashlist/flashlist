/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:flashlist_client/src/protocol/user/app_user.dart' as _i3;
import 'package:flashlist_client/src/protocol/user/user_request.dart' as _i4;
import 'package:flashlist_client/src/protocol/flashlist/flashlist.dart' as _i5;
import 'package:flashlist_client/src/protocol/flashlist/stream_messages/update_flashlist.dart'
    as _i6;
import 'package:flashlist_client/src/protocol/flashlist_item/flashlist_item.dart'
    as _i7;
import 'package:flashlist_client/src/protocol/flashlist_item/stream_messages/delete_flashlist_item.dart'
    as _i8;
import 'package:serverpod_auth_client/module.dart' as _i9;
import 'protocol.dart' as _i10;

/// {@category Endpoint}
class EndpointAppUser extends _i1.EndpointRef {
  EndpointAppUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appUser';

  _i2.Future<_i3.AppUser?> getCurrentUser() =>
      caller.callServerEndpoint<_i3.AppUser?>(
        'appUser',
        'getCurrentUser',
        {},
      );

  _i2.Future<_i3.AppUser?> getUserById(int userId) =>
      caller.callServerEndpoint<_i3.AppUser?>(
        'appUser',
        'getUserById',
        {'userId': userId},
      );

  _i2.Future<_i3.AppUser?> getUserByUsername(String username) =>
      caller.callServerEndpoint<_i3.AppUser?>(
        'appUser',
        'getUserByUsername',
        {'username': username},
      );

  _i2.Future<_i3.AppUser?> getUserByEmail(String email) =>
      caller.callServerEndpoint<_i3.AppUser?>(
        'appUser',
        'getUserByEmail',
        {'email': email},
      );

  _i2.Future<_i4.UserRequest?> getRequestById(int requestId) =>
      caller.callServerEndpoint<_i4.UserRequest?>(
        'appUser',
        'getRequestById',
        {'requestId': requestId},
      );

  _i2.Future<List<_i4.UserRequest?>> getRequestsForUser() =>
      caller.callServerEndpoint<List<_i4.UserRequest?>>(
        'appUser',
        'getRequestsForUser',
        {},
      );

  _i2.Future<void> removeRequest(int requestId) =>
      caller.callServerEndpoint<void>(
        'appUser',
        'removeRequest',
        {'requestId': requestId},
      );

  _i2.Future<void> sendConnectionRequestByEmail(String email) =>
      caller.callServerEndpoint<void>(
        'appUser',
        'sendConnectionRequestByEmail',
        {'email': email},
      );

  _i2.Future<void> acceptConnectionRequest(int requestId) =>
      caller.callServerEndpoint<void>(
        'appUser',
        'acceptConnectionRequest',
        {'requestId': requestId},
      );

  _i2.Future<List<_i3.AppUser>> getConnections() =>
      caller.callServerEndpoint<List<_i3.AppUser>>(
        'appUser',
        'getConnections',
        {},
      );
}

/// {@category Endpoint}
class EndpointFlashlist extends _i1.EndpointRef {
  EndpointFlashlist(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'flashlist';

  /// Creates a new flashlist from the given [flashlist] object.
  /// Also creates a new permission for the currently authenticated user
  /// with access level 'owner'.
  _i2.Future<_i5.Flashlist> createFlashlist(_i5.Flashlist flashlist) =>
      caller.callServerEndpoint<_i5.Flashlist>(
        'flashlist',
        'createFlashlist',
        {'flashlist': flashlist},
      );

  /// Returns all flashlists that the currently authenticated user has permission to view.
  /// Returns an empty list if the user has no permissions.
  _i2.Future<List<_i5.Flashlist>> getFlashlistsForUser() =>
      caller.callServerEndpoint<List<_i5.Flashlist>>(
        'flashlist',
        'getFlashlistsForUser',
        {},
      );

  /// Returns the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to view the flashlist.
  /// Returns null if the flashlist does not exist.
  _i2.Future<_i5.Flashlist?> getFlashlistById(int flashlistId) =>
      caller.callServerEndpoint<_i5.Flashlist?>(
        'flashlist',
        'getFlashlistById',
        {'flashlistId': flashlistId},
      );

  /// Deletes the flashlist with the given [flashlistId].
  /// Throws an exception if the user does not have permission to delete the flashlist.
  _i2.Future<bool> deleteFlashlist(int flashlistId) =>
      caller.callServerEndpoint<bool>(
        'flashlist',
        'deleteFlashlist',
        {'flashlistId': flashlistId},
      );

  /// Updates the flashlist with [id] matching the [update] object.
  /// Throws an exception if the user does not have permission to update the flashlist.
  /// Returns the updated flashlist if successful.
  _i2.Future<_i5.Flashlist> updateFlashlist(_i6.UpdateFlashlist update) =>
      caller.callServerEndpoint<_i5.Flashlist>(
        'flashlist',
        'updateFlashlist',
        {'update': update},
      );

  /// Creates a new flashlist item from the given [flashlistItem] object.
  /// Returns the created flashlist item if successful.
  _i2.Future<_i7.FlashlistItem> createFlashlistItem(
          _i7.FlashlistItem flashlistItem) =>
      caller.callServerEndpoint<_i7.FlashlistItem>(
        'flashlist',
        'createFlashlistItem',
        {'flashlistItem': flashlistItem},
      );

  /// Deletes the flashlist item with the given [flashlistItemId].
  /// Returns true if successful.
  _i2.Future<bool> deleteFlashlistItem(
          _i8.DeleteFlashlistItem deleteItemObject) =>
      caller.callServerEndpoint<bool>(
        'flashlist',
        'deleteFlashlistItem',
        {'deleteItemObject': deleteItemObject},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i9.Caller(client);
  }

  late final _i9.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i10.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    appUser = EndpointAppUser(this);
    flashlist = EndpointFlashlist(this);
    modules = _Modules(this);
  }

  late final EndpointAppUser appUser;

  late final EndpointFlashlist flashlist;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'appUser': appUser,
        'flashlist': flashlist,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
