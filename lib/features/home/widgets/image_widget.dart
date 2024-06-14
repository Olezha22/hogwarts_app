import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          width: 280,
          height: 230,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/connection_error.webp',
              width: 280,
              height: 230,
            );
          },
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
