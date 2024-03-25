import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  /// A placeholder for an avatar with the initials of [username].
  ///
  /// Generates a background color based on the username.
  ///
  /// [radius] by default is 50.0.
  ///
  /// Usage:
  /// ```dart
  /// AvatarPlaceholder(
  ///  username: 'John Doe',
  ///  radius: 60.0,
  /// )
  /// ```
  const AvatarPlaceholder({
    super.key,
    required this.username,
    this.radius = 50.0,
  });

  final String username;
  final double radius;

  Color generateColor(String username) {
    final hash = username.hashCode;
    // shifts result to the right by 16 bits and then takes the bitwise AND with 0xFF
    final r = (hash & 0xFF0000) >> 16;
    // shifts result to the right by 8 bits and then takes the bitwise AND with 0xFF
    final g = (hash & 0x00FF00) >> 8;
    // takes the bitwise AND with 0xFF
    final b = (hash & 0x0000FF);

    return Color.fromARGB(255, r, g, b);
  }

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
      backgroundColor: generateColor(username),
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.6,
        ),
      ),
    );
  }
}
