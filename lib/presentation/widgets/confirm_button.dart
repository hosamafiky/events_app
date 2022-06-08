import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: Palette.kSecondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
          ),
        ),
        alignment: Alignment.center,
        height: 60.0,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
