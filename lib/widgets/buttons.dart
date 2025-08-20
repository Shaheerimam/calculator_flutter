import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  String text;
  final VoidCallback onClick;
  Color? color;
  buttons({super.key, required this.text, required this.onClick, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick,

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: CircleBorder(),
          backgroundColor: color ?? Colors.grey[600],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
