import 'package:flutter/material.dart';

class ColoredCircleIconButton extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final double size;

  const ColoredCircleIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = Colors.white30,
    this.onTap,
    this.onTapUp,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: InkWell(
          onTap: onTap,
          onTapUp: onTapUp,
          borderRadius: BorderRadius.circular(10000),
          child: Padding(padding: const EdgeInsets.all(2.0), child: icon),
        ),
      ),
    );
  }
}
