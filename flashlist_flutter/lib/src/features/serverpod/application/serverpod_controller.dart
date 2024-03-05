import 'dart:io';
import 'package:flashlist_client/flashlist_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'serverpod_controller.g.dart';

@riverpod
Client client(ClientRef ref) => Client(
      // The Android endpoint for Genymotion is 10.0.3.2
      "http://${Platform.isAndroid ? "10.0.3.2" : "localhost"}:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

@riverpod
SessionManager sessionManager(SessionManagerRef ref) =>
    SessionManager(caller: ref.watch(clientProvider).modules.auth);

class ServerpodController {
  ServerpodController(this.client, this.sessionManager) {
    sessionManager.initialize();
  }

  final Client client;
  final SessionManager sessionManager;
}

@riverpod
ServerpodController serverpodController(ServerpodControllerRef ref) =>
    ServerpodController(
      ref.watch(clientProvider),
      ref.watch(sessionManagerProvider),
    );
