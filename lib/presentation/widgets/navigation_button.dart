import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = Palette.kSecondaryColor,
    this.isFilled = false,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color color;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0,
        ),
        decoration: BoxDecoration(
          color: isFilled ? color : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
          ),
          border: isFilled
              ? null
              : Border.all(
                  color: color,
                  width: 2.0,
                ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isFilled ? Colors.white : color,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
