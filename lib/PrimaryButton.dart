// Create button component
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  final double margin;
  final double height;
  final double width;

  PrimaryButton({
    required this.text,
    press,
    this.height = 50,
    this.width = 140,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.margin = 10,
  }) : press = press ?? (() {});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: press,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5.0), // Set the border radius here
              ),
            ),
          ),
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
