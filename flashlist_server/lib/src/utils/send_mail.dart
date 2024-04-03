import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<bool> sendEmailFromFlashlist(
  String userName,
  String password,
  String email,
  String subject,
  String text,
) async {
  final smtpServer = SmtpServer(
    'smtp.openxchange.eu',
    username: userName,
    password: password,
  );

  final message = Message()
    ..from = Address(userName)
    ..recipients.add(email)
    ..subject = subject
    ..text = text;

  try {
    final sendReport = await send(message, smtpServer);
    print(sendReport);
    print('Message sent: ' + sendReport.toString());
    return true;
  } catch (e) {
    print('Message not sent: ' + e.toString());
    return false;
  }
}
