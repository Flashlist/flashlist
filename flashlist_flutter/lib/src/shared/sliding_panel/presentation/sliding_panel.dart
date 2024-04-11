import 'package:flutter/material.dart';

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({
    super.key,
    this.child,
    required this.direction,
    required this.withBackground,
  });
  final Widget? child;
  final SlideDirection direction;
  final bool withBackground;

  static const paddingWidth = 6.0;
  static const leftPanelFixedWidth = 54.0;
  static const panelHeight = 38.0;

  EdgeInsets get padding => direction == SlideDirection.rightToLeft
      ? const EdgeInsets.only(left: 3, right: 6)
      : const EdgeInsets.only(left: 6, right: 3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          color: withBackground ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: child,
      ),
    );
  }
}
