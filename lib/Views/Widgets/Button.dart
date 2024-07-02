import 'package:flutter/material.dart';
import 'package:my_andalas/Styles/Theme.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(10000, 50),
  backgroundColor: primary,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

final ButtonStyle buttonDisabled = ElevatedButton.styleFrom(
  minimumSize: const Size(1000, 50),
  backgroundColor: primary,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
