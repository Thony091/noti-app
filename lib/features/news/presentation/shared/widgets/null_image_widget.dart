import 'package:flutter/material.dart';

class NullImageWidget extends StatelessWidget {
  const NullImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/images/no-image.jpg', 
        width: 100, 
        fit: BoxFit.cover
      );
  }
}
