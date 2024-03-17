import 'package:flashlist_flutter/src/features/color_picker/presentation/advanced_color.dart/hex_input.dart';
import 'package:flashlist_flutter/src/features/color_picker/presentation/advanced_color.dart/recent_colors.dart';
import 'package:flutter/material.dart';

/// Advanced color picker widget
/// Contains the [RecentColors] and [HexInput] widgets

// Unimplemented: RecentColors
// Bug in HexInput
class AdvancedColor extends StatelessWidget {
  const AdvancedColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        children: [
          RecentColors(),
          SizedBox(height: 6),
          HexInput(),
        ],
      ),
    );
  }
}
