import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'authentication.g.dart';

@riverpod
Stream<bool> isAuthenticated(IsAuthenticatedRef ref) async* {
  final SessionManager sessionManager = ref.watch(sessionManagerProvider);

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  yield sessionManager.signedInUser != null;
}
