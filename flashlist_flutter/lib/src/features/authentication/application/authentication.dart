import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/utils/serverpod/serverpod_controller.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'authentication.g.dart';

/// Controller for authentication functionality.
///
/// Note: singIn functionality is handled by serverpod_auth_shared_flutter through the [SignInWithEmailButton] widget.
class AuthenticationController {
  AuthenticationController(this.sessionManager);

  final SessionManager sessionManager;

  /// Signs out the current user and invalidates the session.
  /// This will also trigger the [isAuthenticatedProvider] to update.
  void signOut() {
    sessionManager.signOut();
  }
}

/// Provider for the [AuthenticationController].
@riverpod
AuthenticationController authenticationController(
        AuthenticationControllerRef ref) =>
    AuthenticationController(ref.watch(sessionManagerProvider));

/// Provider for the authentication-state
/// returns a [bool] corresponding with the current authentication state.
@riverpod
Stream<bool> isAuthenticated(IsAuthenticatedRef ref) async* {
  final SessionManager sessionManager = ref.watch(sessionManagerProvider);

  sessionManager.addListener(() {
    ref.invalidateSelf();
  });

  yield sessionManager.signedInUser != null;
}
