import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';

part 'authentication.g.dart';

@riverpod
Stream<dynamic> isAuthenticated(IsAuthenticatedRef ref) async* {
  final sessionManager = ref.watch(sessionManagerProvider);

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  yield sessionManager.signedInUser;
}
