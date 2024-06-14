import 'package:flutter/material.dart';

class AttemptsWidget extends StatelessWidget {
  final String text;
  final String subText;
  const AttemptsWidget({
    super.key,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(subText),
        ],
      ),
    );
  }
}
