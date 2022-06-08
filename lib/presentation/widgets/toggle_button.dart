import 'package:events_app/constants/palette.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
    required this.value,
    this.width = 100.0,
    this.height,
    required this.onTap,
  }) : super(key: key);

  final bool value;
  final double width;
  final double? height;
  final Function() onTap;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = widget.height ?? widget.width * 0.4;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height,
      width: widget.width,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        gradient: widget.value ? Palette.fieldGradient : null,
        color: !widget.value ? Colors.grey[300] : null,
        border: Border.all(
          color: Colors.grey[400]!,
          width: 1.0,
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: 0.0,
              bottom: 0.0,
              left: widget.value ? 0.6 * widget.width : 0.0,
              right: widget.value ? 0.0 : 0.6 * widget.width,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: _animation!,
                    child: child,
                  );
                },
                child: Container(
                  width: 0.27 * widget.width,
                  height: 0.27 * widget.width,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
