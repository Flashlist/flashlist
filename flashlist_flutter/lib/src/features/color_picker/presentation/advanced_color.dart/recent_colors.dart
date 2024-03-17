import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';

class RecentColors extends StatelessWidget {
  const RecentColors({super.key});

  @override
  Widget build(BuildContext context) {
    /// RecentColors is a row of 8 colors that the user has recently used
    /// Should be saved either in local storage or in a database
    /// TODO: implement saving recent colors
    return Expanded(
      child: Row(
        children: [
          for (var i = 0; i < 8; i++)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorSchemeOf(context).onBackground,
                ),
                color: Color.lerp(
                  Colors.teal,
                  Colors.purple,
                  i / 8,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              width: (mediaQueryOf(context).size.width - 28) / 8,
              height: Sizes.p40,
            ),
        ],
      ),
    );
  }
}
