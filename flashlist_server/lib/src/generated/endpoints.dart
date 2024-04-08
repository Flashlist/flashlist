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
import 'package:serverpod_auth_server/module.dart' as _i4;

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
        'getRequestForUserByParameter': _i1.MethodConnector(
          name: 'getRequestForUserByParameter',
          params: {
            'parameter': _i1.ParameterDescription(
              name: 'parameter',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint)
                  .getRequestForUserByParameter(
            session,
            params['parameter'],
          ),
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
        'getUserAccessLevelForFlashlist': _i1.MethodConnector(
          name: 'getUserAccessLevelForFlashlist',
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
                  .getUserAccessLevelForFlashlist(
            session,
            params['flashlistId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
