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
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'protocol.dart' as _i6;

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

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    appUser = EndpointAppUser(this);
    modules = _Modules(this);
  }

  late final EndpointAppUser appUser;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'appUser': appUser};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
