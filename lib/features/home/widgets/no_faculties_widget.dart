import 'package:flutter/material.dart';

class NoFacultiesWidget extends StatelessWidget {
  final String subText;
  final void Function(String) onSelected;
  const NoFacultiesWidget({
    super.key,
    required this.subText, required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(""),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        width: 340,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey.shade300,
        ),
        child: Column(
          children: [
            Text(
              subText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
