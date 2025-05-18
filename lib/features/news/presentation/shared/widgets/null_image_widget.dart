import 'package:flutter/material.dart';

class NullImageWidget extends StatelessWidget {
  
  final isCompleteNew;

  const NullImageWidget({
    super.key,
    this.isCompleteNew = false,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Image.asset(
        'assets/images/no-image.jpg', 
        width: !isCompleteNew 
          ? size.width * 0.25 
          : size.width * 0.65,
        fit: BoxFit.cover
      );
  }
}
