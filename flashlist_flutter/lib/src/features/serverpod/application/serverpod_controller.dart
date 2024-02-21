import 'dart:io';
import 'package:flashlist_client/flashlist_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'serverpod_controller.g.dart';

class ServerpodController {
  ServerpodController(this.ref) {
    sessionManager = SessionManager(
      caller: client.modules.auth,
    );
    sessionManager.initialize();
  }

  final Ref ref;

  final client = Client(
    // The Android endpoint for Genymotion is 10.0.3.2
    "http://${Platform.isAndroid ? "10.0.3.2" : "localhost"}:8080/",
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  late SessionManager sessionManager;
  SessionManager get session => sessionManager;
}

@riverpod
ServerpodController serverpodController(ServerpodControllerRef ref) =>
    ServerpodController(ref);

@riverpod
Client client(ClientRef ref) => ref.read(serverpodControllerProvider).client;

@riverpod
SessionManager sessionManager(SessionManagerRef ref) =>
    ref.read(serverpodControllerProvider).sessionManager;

