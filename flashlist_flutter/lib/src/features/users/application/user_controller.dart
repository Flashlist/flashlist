import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

class UserController {
  /// Controller for user related actions.
  UserController(this.ref);

  final Ref ref;

  Future<AppUser?> getCurrentUser() async {
    final client = ref.read(clientProvider);
    return await client.appUser.getCurrentUser();
  }

  Future<AppUser?> getUserById(int id) async {
    final client = ref.read(clientProvider);
    return await client.appUser.getUserById(id);
  }

  Future<void> sendConnectionRequestByEmail(String email) async {
    final client = ref.read(clientProvider);
    await client.appUser.sendConnectionRequestByEmail(email);
  }

  Future<void> acceptConnectionRequest(int requestId) async {
    final client = ref.read(clientProvider);
    await client.appUser.acceptConnectionRequest(requestId);
  }

  Future<void> removeRequest(int requestId) async {
    final client = ref.read(clientProvider);
    await client.appUser.removeRequest(requestId);
  }

  Future<List<AppUser>> getConnections() async {
    final client = ref.read(clientProvider);
    return await client.appUser.getConnections();
  }

  Future<List<UserRequest?>> getPendingRequests() async {
    final client = ref.read(clientProvider);
    return await client.appUser.getRequestsForUser();
  }
}

@riverpod
UserController userController(Ref ref) => UserController(ref);

@riverpod
Future<AppUser?> currentUser(CurrentUserRef ref) =>
    ref.watch(userControllerProvider).getCurrentUser();

@riverpod
Future<List<AppUser>> connections(ConnectionsRef ref) =>
    ref.watch(userControllerProvider).getConnections();

@riverpod
Future<List<UserRequest?>> pendingRequests(PendingRequestsRef ref) =>
    ref.watch(userControllerProvider).getPendingRequests();

@riverpod
Future<AppUser?> userById(UserByIdRef ref, int id) =>
    ref.watch(userControllerProvider).getUserById(id);
