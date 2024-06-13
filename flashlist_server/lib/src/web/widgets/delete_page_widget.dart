import 'package:serverpod/serverpod.dart';

class DeletePageWidget extends Widget {
  DeletePageWidget() : super(name: 'default') {
    values = {
      'served': DateTime.now(),
      'runmode': Serverpod.instance.runMode,
    };
  }
}
