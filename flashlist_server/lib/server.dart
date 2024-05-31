import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'package:flashlist_server/src/utils/send_mail.dart';
import 'package:flashlist_server/src/web/routes/root.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        // Send the validation email to the user.
        // Return `true` if the email was successfully sent, otherwise `false`.
        // print(validationCode);
        // return true;
        try {
          return await sendEmailFromFlashlist(
            session.server.passwords['emailUsername']!,
            session.server.passwords['emailPassword']!,
            email,
            'Flashlist Email Validation',
            'Your validation code is: $validationCode',
          );
        } catch (e) {
          print(e);
          return false;
        }
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        // Send the password reset email to the user.
        // Return `true` if the email was successfully sent, otherwise `false`.
        print(validationCode);
        return true;
      },
      onUserCreated: (session, userInfo) {
        return AppUser.db.insertRow(
          session,
          AppUser(
            userId: userInfo.id!,
            email: userInfo.email!,
            username: userInfo.userName!,
          ),
        );
      },
    ),
  );

  // Start the server.
  await pod.start();
}
