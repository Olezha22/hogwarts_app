import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/db_hive/hive_repository.dart';
import 'package:hogwards_app/models/student_model.dart';

part 'students_list_event.dart';
part 'students_list_state.dart';

class StudentsListBloc extends Bloc<StudentsListEvent, StudentsListState> {
  StudentsListBloc() : super(StudentsListInitial()) {
    on<LoadStudentsList>(_onLoadStudentsList);
    on<ResetAll>(_onResetAll);
    on<SearchStudents>(_onSearchStudents);
  }

  Future<void> _onLoadStudentsList(
      LoadStudentsList event, Emitter<StudentsListState> emit) async {
    if (state is! StudentsListLoaded) {
      emit(StudentsListLoading());
    }

    final students = HiveRepository().getAllStudents();
    final filteredData = _filterStudents(students);

    emit(StudentsListLoaded(
        students: filteredData.students, indexes: filteredData.indexes));
  }

  void _onResetAll(ResetAll event, Emitter<StudentsListState> emit)  {
    try {
      if (state is StudentsListLoaded) {
        emit(StudentsListLoading());

        HiveRepository().resetAll();
        final students = HiveRepository().getAllStudents();
        final filteredData = _filterStudents(students);

        emit(StudentsListLoaded(
            students: filteredData.students, indexes: filteredData.indexes));
      }
    } catch (e) {
      emit(StudentsListLoadingFailure(exception: e));
    }
  }

  void _onSearchStudents(SearchStudents event, Emitter<StudentsListState> emit) {
    if (state is StudentsListLoaded) {
      final students = HiveRepository().getAllStudents();
      final updatedStudents = event.query.isEmpty
          ? students
          : students.where((student) {
              return student.name.toLowerCase().contains(event.query.toLowerCase());
            }).toList();
      final filteredData = _filterStudents(updatedStudents);

      emit(StudentsListLoaded(
          students: filteredData.students, indexes: filteredData.indexes));
    }
  }

  _FilteredStudents _filterStudents(List<StudentModel> students) {
    final List<StudentModel> updatedStudents = [];
    final List<int> indexes = [];

    for (int i = 0; i < students.length; i++) {
      if (students[i].failedAttempts > 0 || students[i].successAttempts > 0) {
        updatedStudents.add(students[i]);
        indexes.add(i);
      }
    }

    return _FilteredStudents(students: updatedStudents, indexes: indexes);
  }
}

class _FilteredStudents {
  final List<StudentModel> students;
  final List<int> indexes;

  _FilteredStudents({required this.students, required this.indexes});
}
