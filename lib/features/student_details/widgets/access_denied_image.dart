import 'package:flutter/material.dart';

class AccessDeniedImage extends StatelessWidget {
  const AccessDeniedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/access_denied.png'),
      height: 110,
    );
  }
}
