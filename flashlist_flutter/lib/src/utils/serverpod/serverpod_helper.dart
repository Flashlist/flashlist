import 'dart:io';
import 'package:flashlist_client/flashlist_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'serverpod_helper.g.dart';

@riverpod
Client client(ClientRef ref) => Client(
      // "http://${Platform.isAndroid ? "10.0.3.2" : "localhost"}:8080/",
      "https://api.flashlistapp.com/",
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

@riverpod
SessionManager sessionManager(SessionManagerRef ref) =>
    SessionManager(caller: ref.watch(clientProvider).modules.auth);

/// Helper class for [Serverpod] functionality.
/// It manages the lifecycle of the client and the session manager.
///
/// Usage with either [read] or [watch] from the [ref] parameter:
/// ```dart
/// final ServerpodHelper = ref.watch(serverpodHelperProvider);
/// ```
///
/// The individual providers are also available for direct usage:
/// ```dart
/// final client = ref.read(clientProvider);
/// final sessionManager = ref.watch(sessionManagerProvider);
/// ```
class ServerpodHelper {
  ServerpodHelper(this.client, this.sessionManager) {
    sessionManager.initialize();
  }

  final Client client;
  final SessionManager sessionManager;
}

/// Provider for the serverpodHelper class
/// Automatically caches and disposes the helper when no longer used.
@riverpod
ServerpodHelper serverpodHelper(ServerpodHelperRef ref) => ServerpodHelper(
      ref.watch(clientProvider),
      ref.watch(sessionManagerProvider),
    );
