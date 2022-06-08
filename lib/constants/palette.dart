import 'package:flutter/material.dart';

class Palette {
  static const kPrimaryColor = Color(0xFF121320);
  static const kSecondaryColor = Color(0xFF0EC6EC);
  static LinearGradient fieldGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFF3DB8D2), Color(0xFFC11051)],
  );
}
