import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color backgroundColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(150, 60), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, color: iconColor, size: 24), 
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400), 
          ),
        ],
      ),
    );
  }
}