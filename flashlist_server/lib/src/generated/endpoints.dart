/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/app_user_endpoint.dart' as _i2;
import '../endpoints/flashlist_endpoint.dart' as _i3;
import 'package:flashlist_server/src/generated/flashlist/flashlist.dart' as _i4;
import 'package:flashlist_server/src/generated/flashlist/stream_messages/update_flashlist.dart'
    as _i5;
import 'package:flashlist_server/src/generated/flashlist_item/flashlist_item.dart'
    as _i6;
import 'package:flashlist_server/src/generated/flashlist_item/stream_messages/delete_flashlist_item.dart'
    as _i7;
import 'package:serverpod_auth_server/module.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'appUser': _i2.AppUserEndpoint()
        ..initialize(
          server,
          'appUser',
          null,
        ),
      'flashlist': _i3.FlashlistEndpoint()
        ..initialize(
          server,
          'flashlist',
          null,
        ),
    };
    connectors['appUser'] = _i1.EndpointConnector(
      name: 'appUser',
      endpoint: endpoints['appUser']!,
      methodConnectors: {
        'getCurrentUser': _i1.MethodConnector(
          name: 'getCurrentUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .getCurrentUser(session),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).getUserById(
            session,
            params['userId'],
          ),
        ),
        'getUserByUsername': _i1.MethodConnector(
          name: 'getUserByUsername',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).getUserByUsername(
            session,
            params['username'],
          ),
        ),
        'getUserByEmail': _i1.MethodConnector(
          name: 'getUserByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).getUserByEmail(
            session,
            params['email'],
          ),
        ),
        'getRequestById': _i1.MethodConnector(
          name: 'getRequestById',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).getRequestById(
            session,
            params['requestId'],
          ),
        ),
        'getRequestsForUser': _i1.MethodConnector(
          name: 'getRequestsForUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .getRequestsForUser(session),
        ),
        'removeRequest': _i1.MethodConnector(
          name: 'removeRequest',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).removeRequest(
            session,
            params['requestId'],
          ),
        ),
        'sendConnectionRequestByEmail': _i1.MethodConnector(
          name: 'sendConnectionRequestByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .sendConnectionRequestByEmail(
            session,
            params['email'],
          ),
        ),
        'acceptConnectionRequest': _i1.MethodConnector(
          name: 'acceptConnectionRequest',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .acceptConnectionRequest(
            session,
            params['requestId'],
          ),
        ),
        'getConnections': _i1.MethodConnector(
          name: 'getConnections',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .getConnections(session),
        ),
      },
    );
    connectors['flashlist'] = _i1.EndpointConnector(
      name: 'flashlist',
      endpoint: endpoints['flashlist']!,
      methodConnectors: {
        'createFlashlist': _i1.MethodConnector(
          name: 'createFlashlist',
          params: {
            'flashlist': _i1.ParameterDescription(
              name: 'flashlist',
              type: _i1.getType<_i4.Flashlist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint).createFlashlist(
            session,
            params['flashlist'],
          ),
        ),
        'getFlashlistsForUser': _i1.MethodConnector(
          name: 'getFlashlistsForUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint)
                  .getFlashlistsForUser(session),
        ),
        'getFlashlistById': _i1.MethodConnector(
          name: 'getFlashlistById',
          params: {
            'flashlistId': _i1.ParameterDescription(
              name: 'flashlistId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint)
                  .getFlashlistById(
            session,
            params['flashlistId'],
          ),
        ),
        'deleteFlashlist': _i1.MethodConnector(
          name: 'deleteFlashlist',
          params: {
            'flashlistId': _i1.ParameterDescription(
              name: 'flashlistId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint).deleteFlashlist(
            session,
            params['flashlistId'],
          ),
        ),
        'updateFlashlist': _i1.MethodConnector(
          name: 'updateFlashlist',
          params: {
            'update': _i1.ParameterDescription(
              name: 'update',
              type: _i1.getType<_i5.UpdateFlashlist>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint).updateFlashlist(
            session,
            params['update'],
          ),
        ),
        'createFlashlistItem': _i1.MethodConnector(
          name: 'createFlashlistItem',
          params: {
            'flashlistItem': _i1.ParameterDescription(
              name: 'flashlistItem',
              type: _i1.getType<_i6.FlashlistItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint)
                  .createFlashlistItem(
            session,
            params['flashlistItem'],
          ),
        ),
        'deleteFlashlistItem': _i1.MethodConnector(
          name: 'deleteFlashlistItem',
          params: {
            'deleteItemObject': _i1.ParameterDescription(
              name: 'deleteItemObject',
              type: _i1.getType<_i7.DeleteFlashlistItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flashlist'] as _i3.FlashlistEndpoint)
                  .deleteFlashlistItem(
            session,
            params['deleteItemObject'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
