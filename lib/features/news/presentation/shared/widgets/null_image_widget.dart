import 'package:flutter/material.dart';

class NullImageWidget extends StatelessWidget {
  const NullImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Image.asset(
        'assets/images/no-image.jpg', 
        width: size.width * 0.25, 
        fit: BoxFit.cover
      );
  }
}
