import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.onTap,
    this.text = 'إلغاء',
  }) : super(key: key);

  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60.0,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
