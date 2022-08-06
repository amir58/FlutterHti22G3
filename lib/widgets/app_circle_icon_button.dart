import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  MyCircleIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.black,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
