import 'package:flutter/material.dart';

void nextPage(context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}
