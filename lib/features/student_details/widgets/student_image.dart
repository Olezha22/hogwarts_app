import 'package:flutter/material.dart';

class StudentImage extends StatelessWidget {
  final String imageUrl;

  const StudentImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 170,
      errorBuilder: (context, error, stackTrace) {
        return const Image(
          image: AssetImage('assets/connection_error.webp'),
          height: 170,
        );
      },
    );
  }
}
