import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/theme/card_theme.dart';
import 'package:flashlist_flutter/src/theme/text_theme.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.exoTextTheme(
    textTheme.apply(bodyColor: Colors.black),
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
    background:
        const Color(0xFFF0F0F0), // Change this to your desired background color
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFF0F0F0),
  ),
  cardTheme: cardTheme.copyWith(
    margin: const EdgeInsets.all(Sizes.p4),
  ),
);
