import 'package:flutter/material.dart';
import 'package:hogwards_app/features/student_details/widgets/student_detail_row.dart';
import 'package:hogwards_app/models/student_model.dart';

class StudentDetails extends StatelessWidget {
  final StudentModel student;

  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (student.house.isNotEmpty)
          StudentDetailRow(label: "House", value: student.house),
        if (student.dateOfBirth.isNotEmpty)
          StudentDetailRow(label: "Date of birth", value: student.dateOfBirth),
        if (student.actor.isNotEmpty)
          StudentDetailRow(label: "Actor", value: student.actor),
        if (student.species.isNotEmpty)
          StudentDetailRow(label: "Species", value: student.species),
      ],
    );
  }
}
