import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    this.buttonText,
    this.onTap,
    this.color,
    this.textColor,
    this.borderColor, // New field for border color
    required this.textStyle,
  });

  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor; // New field for border color
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 20.0), // Adjust padding if needed
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(70), // Set border radius to 70
          border: Border.all(
              color: borderColor ?? textColor!,
              width: 2), // Use borderColor if provided
        ),
        child: Center(
          child: Text(
            buttonText!,
            textAlign: TextAlign.center,
            style: textStyle.copyWith(color: textColor!), // Set the text color
          ),
        ),
      ),
    );
  }
}
