import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.isPassword = false,
    this.isWhite = false,
    this.hintText,
    this.notWhite = false,
  }) : super(key: key);

  final String label;
  final String? icon;
  final bool isPassword;
  final bool isWhite;
  final String? hintText;
  final bool notWhite;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String suffixIconColor = '';
  @override
  void initState() {
    suffixIconColor = widget.isWhite ? 'gray' : 'white';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          suffixIconColor = hasFocus
              ? 'blue'
              : widget.isWhite
                  ? 'gray'
                  : 'white';
        });
      },
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        onTap: () {},
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: widget.isWhite ? Colors.grey : Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: GradientOutlineInputBorder(
            gradient: Palette.fieldGradient,
            width: 2.0,
            borderRadius: BorderRadius.circular(30.0),
          ),
          labelStyle: TextStyle(
            color: widget.isWhite ? Colors.grey : Colors.white,
            fontSize: widget.isWhite ? 18.0 : 14.0,
          ),
          floatingLabelStyle: const TextStyle(
            color: Palette.kSecondaryColor,
            fontSize: 18.0,
          ),
          labelText: widget.label,
          floatingLabelBehavior: widget.isWhite
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          suffixIcon: widget.icon != null
              ? Container(
                  padding: widget.isWhite
                      ? const EdgeInsets.only(right: 20.0)
                      : const EdgeInsets.only(left: 20.0),
                  child: Image.asset(widget.notWhite
                      ? 'assets/images/${widget.icon}.png'
                      : 'assets/images/${suffixIconColor}_${widget.icon}.png'),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            maxWidth: widget.isWhite ? 50.0 : 40.0,
          ),
        ),
      ),
    );
  }
}
