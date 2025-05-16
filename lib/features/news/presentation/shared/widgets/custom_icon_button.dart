import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final IconData icon;
  final Function() onTap;
  final double? size;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 12,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
