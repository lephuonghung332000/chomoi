import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.imageName,
    this.onPressed,
    this.size = 36,
  });

  final String imageName;
  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        color: Colors.transparent,
        onPressed: onPressed,
        iconSize: 30,
        icon: Image.asset(imageName),
      ),
    );
  }
}
