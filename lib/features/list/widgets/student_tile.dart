import 'package:flutter/material.dart';
import 'package:hogwards_app/models/student_model.dart';

class StudentTile extends StatelessWidget {
  final StudentModel student;
  final VoidCallback onRetry;

  const StudentTile({super.key, required this.student, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        student.image,
        width: 35,
        height: 60,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/connection_error.webp', width: 35, height: 60);
        },
      ),
      trailing: student.successAttempts > 0
          ? const Image(image: AssetImage('assets/mark_yes.png'), height: 30)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onRetry,
                  child: const Icon(Icons.refresh, size: 32),
                ),
                const SizedBox(width: 10),
                const Image(image: AssetImage('assets/mark_no.png'), height: 30),
              ],
            ),
      title: Text(
        student.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Attempts: ${student.successAttempts + student.failedAttempts}"),
    );
  }
}
