import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/share/share_via_email.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/share/share_with_connections.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// A modal to share a flashlist with connections or via email
class ShareModal extends ConsumerWidget {
  const ShareModal(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.all(Sizes.p16),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              '${localizationsOf(context).share} ${flashlist.title}',
              style: const TextStyle(fontSize: Sizes.p20),
            ),
            TabBar(
              tabs: [
                Tab(text: localizationsOf(context).withConnections),
                Tab(text: localizationsOf(context).viaEmail),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ShareWithConnections(flashlist),
                  ShareViaEmail(flashlist),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
