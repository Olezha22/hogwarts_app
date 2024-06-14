import 'package:flutter/material.dart';
import 'package:hogwards_app/features/home/widgets/faculties_widget.dart';

class FacultyRow extends StatelessWidget {
  final List<String> faculties;
  final void Function(String) onFacultySelected;
  const FacultyRow(
      {super.key, required this.faculties, required this.onFacultySelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: faculties
          .map((faculty) => FacultiesWidget(
                subText: faculty,
                onSelected: onFacultySelected,
              ))
          .toList(),
    );
  }
}
