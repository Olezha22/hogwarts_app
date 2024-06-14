import 'package:flutter/material.dart';

class FacultiesWidget extends StatelessWidget {
  final String subText;
  final void Function(String) onSelected;

  const FacultiesWidget({
    super.key,
    required this.subText, required this.onSelected,
  });

  String get facultyImage {
    switch (subText) {
      case "Gryffindor":
        return 'assets/gryffindor.webp';
      case "Hufflepuff":
        return 'assets/hufflepuff.webp';
      case "Ravenclaw":
        return 'assets/ravenclaw.webp';
      case "Slytherin":
        return 'assets/slytherin.webp';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(subText),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        width: 155,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey.shade300,
        ),
        child: Column(
          children: [
            Image.asset(
              facultyImage,
              width: 40,
            ),
            Text(subText),
          ],
        ),
      ),
    );
  }
}
