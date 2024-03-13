import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/theme/card_theme.dart';
import 'package:flashlist_flutter/src/theme/text_theme.dart';

final darkTheme = ThemeData(
  textTheme: GoogleFonts.exoTextTheme(
    textTheme.apply(bodyColor: Colors.white),
  ),
  useMaterial3: true,
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.dark,
  cardTheme: cardTheme.copyWith(
    margin: const EdgeInsets.all(Sizes.p4),
    color: Colors.black38,
  ),
);
