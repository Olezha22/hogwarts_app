import 'package:flutter/material.dart';
import 'package:hogwards_app/features/list/bloc/students_list_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  final StudentsListBloc studentsListBloc;

  const SearchBarWidget({super.key, required this.studentsListBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: (query) {
          studentsListBloc.add(SearchStudents(query));
        },
        decoration: InputDecoration(
          hintText: 'Filter Characters',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
