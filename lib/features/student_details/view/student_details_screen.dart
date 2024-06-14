import 'package:flutter/material.dart';
import 'package:hogwards_app/features/student_details/widgets/widgets.dart';
import 'package:hogwards_app/models/student_model.dart';

class StudentDetailsScreen extends StatelessWidget {
  final StudentModel student;

  const StudentDetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StudentImage(imageUrl: student.image),
            const SizedBox(width: 20),
            Expanded(
              child: student.successAttempts > 0
                ? StudentDetails(student: student)
                : const AccessDeniedImage(),
            ),
          ],
        ),
      ),
    );
  }
}
