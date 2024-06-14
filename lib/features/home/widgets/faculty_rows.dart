import 'package:flutter/material.dart';
import 'package:hogwards_app/features/home/widgets/faculty_row.dart';
import 'package:hogwards_app/features/home/widgets/no_faculties_widget.dart';

class FacultyRows extends StatelessWidget {
  final void Function(String) onFacultySelected;
  const FacultyRows({super.key, required this.onFacultySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FacultyRow(
          faculties: const ["Gryffindor", "Slytherin"],
          onFacultySelected: onFacultySelected,
        ),
        FacultyRow(
          faculties: const ["Ravenclaw", "Hufflepuff"],
          onFacultySelected: onFacultySelected,
        ),
        NoFacultiesWidget(
          subText: "Not in House",
          onSelected: onFacultySelected,
        ),
      ],
    );
  }
}
