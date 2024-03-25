import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AvatarGroup extends HookWidget {
  const AvatarGroup(this.authors, {super.key});

  final List<AppUser?> authors;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 0.3,
      lowerBound: 0.3,
      upperBound: 0.8,
    );

    CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    void expandTemporarily() {
      if (!isExpanded.value) {
        isExpanded.value = true;
        animationController.forward();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            isExpanded.value = false;
            animationController.reverse();
          },
        );
      } else {
        isExpanded.value = false;
        animationController.reverse();
      }
    }

    if (authors.isEmpty) {
      return const SizedBox(
        width: 35,
      );
    }

    return GestureDetector(
      onTap: authors.length > 1 ? expandTemporarily : null,
      child: Container(
        padding: const EdgeInsets.only(left: Sizes.p16),
        height: 35,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: authors.length,
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: isExpanded.value
                      ? Alignment.bottomRight
                      : Alignment.bottomRight,
                  widthFactor: index == authors.length - 1 ? 0.9 : 0.4,
                  child: SizedBox(
                    width: 30,
                    child: AvatarPlaceholder(
                      username: authors[index]?.username ?? '',
                      radius: 30,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
