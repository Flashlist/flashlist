import 'package:flashlist_flutter/src/shared/sliding_panel/state/animation_controller_state.dart';
import 'package:flashlist_flutter/src/shared/sliding_panel/presentation/sliding_panel.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class SlidingPanelAnimator extends ConsumerStatefulWidget {
  SlidingPanelAnimator({
    super.key,
    required this.direction,
    required this.isOpen,
    required this.child,
    this.withBackground = true,
  });

  final SlideDirection direction;
  bool isOpen;
  final bool withBackground;
  final Widget child;

  // ignore_for_file: no_logic_in_create_state
  @override
  SlidingPanelAnimatorState createState() =>
      SlidingPanelAnimatorState(const Duration(milliseconds: 200));
}

class SlidingPanelAnimatorState
    extends AnimationControllerState<SlidingPanelAnimator> {
  SlidingPanelAnimatorState(super.duration);

  late final _curveAnimation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOutCubic,
  ));

  double _getOffsetX(double screenWidth, double animationValue) {
    final startOffset = widget.direction == SlideDirection.rightToLeft
        ? screenWidth - SlidingPanel.leftPanelFixedWidth
        : -SlidingPanel.leftPanelFixedWidth;
    return startOffset * (1.0 - animationValue);
  }

  @override
  Widget build(BuildContext context) {
    var isOpen = widget.isOpen;

    if (isOpen) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    return AnimatedBuilder(
      animation: _curveAnimation,
      child: SlidingPanel(
        withBackground: widget.withBackground,
        direction: widget.direction,
        child: widget.child,
      ),
      builder: (context, child) {
        final animationValue = _curveAnimation.value;

        // If not open, return an empty container
        if (animationValue == 0.0 && !isOpen) {
          return Container();
        }

        // If open, return the SlidingPanel
        final screenWidth = mediaQueryOf(context).size.width;
        final offsetX = _getOffsetX(screenWidth, animationValue);
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: child,
        );
      },
    );
  }
}
