import 'package:flutter/material.dart';

double newNumberStateMethod(double currentNumber, double newNumber) {
  if (currentNumber < newNumber) return currentNumber = newNumber;
  return currentNumber;
}

double getTextWidth(BuildContext context, String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    maxLines: 1,
  )..layout(
      minWidth: 0, 
      maxWidth: double.infinity
    );
  return textPainter.size.width;
}