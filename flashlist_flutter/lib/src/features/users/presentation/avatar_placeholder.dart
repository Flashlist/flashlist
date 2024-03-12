import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  /// A placeholder for an avatar with the user's initials.
  const AvatarPlaceholder({
    super.key,
    required this.username,
    this.backgroundColor = Colors.blue,
    this.radius = 50.0,
  });

  final String username;
  final Color backgroundColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    String initials = '';
    if (username.isNotEmpty) {
      final splitName = username.split(' ');
      initials = splitName[0][0].toUpperCase();
      if (splitName.length > 1) {
        initials += splitName[splitName.length - 1][0].toUpperCase();
      }
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.8,
        ),
      ),
    );
  }
}
