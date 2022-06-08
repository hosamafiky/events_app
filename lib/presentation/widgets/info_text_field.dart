import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class InfoTextField extends StatefulWidget {
  const InfoTextField({
    Key? key,
    required this.text,
    required this.controller,
    this.isEdit = false,
    this.floating = true,
    this.icon,
    this.isPassword = false,
    this.isLong = false,
  }) : super(key: key);

  final bool isEdit;
  final String text;
  final TextEditingController controller;
  final bool floating;
  final String? icon;
  final bool isPassword;
  final bool isLong;

  @override
  State<InfoTextField> createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  Color labelColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          labelColor = hasFocus ? Palette.kSecondaryColor : Colors.grey;
        });
      },
      child: TextField(
        maxLines: widget.isLong ? 6 : 1,
        readOnly: !widget.isEdit,
        controller: widget.controller,
        style: TextStyle(
          color: widget.isEdit ? Colors.black : Colors.grey,
          fontSize: 18.0,
        ),
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 30.0,
          ),
          focusedBorder: widget.isEdit
              ? GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  width: 2.0,
                  gradient: Palette.fieldGradient,
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          floatingLabelStyle: TextStyle(
            color: labelColor,
            fontSize: 18.0,
          ),
          prefixIcon: widget.icon != null
              ? Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/${widget.icon}',
                    width: 30.0,
                  ),
                )
              : null,
          labelText: widget.text,
          floatingLabelBehavior:
              widget.floating ? FloatingLabelBehavior.always : null,
        ),
      ),
    );
  }
}
