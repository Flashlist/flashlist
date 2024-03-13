import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets(
    'AvatarPlaceholder has correct initials and color',
    (WidgetTester tester) async {
      // Names to test the AvatarPlaceholder with
      final testCases = [
        'Gaius Julius Caesar',
        'Gaius Julius Caesar Augustus',
        'Titus Flavius Sabinus Vespasianus',
        'Marcus Aurelius Antoninus Augustus',
        'Marcus Ulpius Traianus',
        'Justin Case',
        'Pete Sahat',
        'Ben Dover',
        'Barb Dwyer',
        'Anita Bath',
        'Chris P. Bacon',
        'Bill Board',
        'Al Beback',
      ];

      // Pump a widget for each name and verify the initials and color
      for (final username in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: AvatarPlaceholder(
              username: username,
              radius: 60.0,
            ),
          ),
        );

        // find the initials
        final initials =
            '${username[0].toUpperCase()}${username.split(' ').last[0].toUpperCase()}';
        final initialsFinder = find.text(initials);

        // find the circle avatar
        final circleAvatar = tester.widget<CircleAvatar>(
          find.byType(CircleAvatar),
        );

        final Color expectedColor = Color.fromARGB(
          255,
          (username.hashCode & 0xFF0000) >> 16,
          (username.hashCode & 0x00FF00) >> 8,
          username.hashCode & 0x0000FF,
        );

        // verify the initials and color
        expect(initialsFinder, findsOneWidget);
        expect(circleAvatar.backgroundColor, equals(expectedColor));
      }
    },
  );
}
