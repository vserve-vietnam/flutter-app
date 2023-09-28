import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;

  ActionButton(
      {required this.onPressed,
      required this.text,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    Color _buttonColor = buttonColor ?? ThemeColor.get(context).primaryAccent;
    Color _textColor = textColor ?? Colors.white;

    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(text,
            style: TextStyle(
                fontSize: 15, color: _textColor, fontWeight: FontWeight.bold)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttonColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
