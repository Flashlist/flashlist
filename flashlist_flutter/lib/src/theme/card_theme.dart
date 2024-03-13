import 'package:flutter/material.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';

final cardTheme = const CardTheme().copyWith(
  margin: const EdgeInsets.all(Sizes.p4),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(Sizes.p4),
    ),
  ),
);
