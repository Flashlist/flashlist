import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card_header/avatar_group.dart';
import 'package:flutter/material.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card_header/flashlist_menu.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card_header/flashlist_title.dart';

/// A widget to display the header of a flashlist.
/// Includes the title consisting of [Text] and [TextField] widgets
/// depending if the flashlist is in edit mode or not.
/// It also includes controls to delete and edit the flashlist.
/// SOON: An AvatarGroup representing the users that have access to the flashlist.
class FlashlistCardHeader extends StatelessWidget {
  const FlashlistCardHeader({
    super.key,
    required this.flashlist,
  });

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarGroup(flashlist.authors ?? []),
        FlashlistTitle(flashlist: flashlist),
        FlashlistMenu(flashlist),
      ],
    );
  }
}
