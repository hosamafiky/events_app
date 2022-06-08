import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 50.0,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Palette.kSecondaryColor,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
