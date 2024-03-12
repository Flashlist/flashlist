import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

class UserController {
  UserController(this.ref);

  final Ref ref;

  Future<AppUser?> getCurrentUserData() async {
    final client = ref.read(clientProvider);
    return await client.appUser.getCurrentUserObject();
  }
}

@riverpod
UserController userController(Ref ref) => UserController(ref);

@riverpod
Future<AppUser?> currentUser(CurrentUserRef ref) =>
    ref.watch(userControllerProvider).getCurrentUserData();
