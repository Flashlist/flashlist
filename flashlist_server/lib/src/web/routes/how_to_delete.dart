import 'dart:io';

import 'package:flashlist_server/src/web/widgets/delete_page_widget.dart';
import 'package:serverpod/serverpod.dart';

class HowToDeleteRoute extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async {
    return DeletePageWidget();
  }
}
