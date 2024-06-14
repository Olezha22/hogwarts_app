import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/db_hive/hive_repository.dart';
import 'package:hogwards_app/models/student_model.dart';
import 'package:hogwards_app/repositories/student_repository.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  List<StudentModel> students = [];

  StudentsBloc() : super(StudentsInitial()) {
    on<LoadStudents>(_onLoadStudents);
    on<LoadRandomStudent>(_onLoadRandomStudent);
    on<SelectFaculty>(_onSelectFaculty);
    on<ResetAll>(_onResetAll);
    on<LoadStudentAgain>(_onLoadStudentAgain);
  }

  Future<void> _onLoadStudents(LoadStudents event, Emitter<StudentsState> emit) async {
    emit(state is! StudentsLoaded ? StudentsLoading() : state);
    
    try {
      if (!HiveRepository().hasStudents()) {
        students = await StudentRepository().fetchAllStudents();
        HiveRepository().addStudents(students);
      } else {
        students = HiveRepository().getAllStudents();
      }

      final randNum = Random().nextInt(students.length);
      emit(StudentsLoaded(students: students, randNum: randNum));
    } catch (e) {
      emit(StudentsLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onLoadRandomStudent(LoadRandomStudent event, Emitter<StudentsState> emit) async {
    if (state is! StudentsLoaded) return;

    emit(StudentsLoading());

    try {
      var randNum = Random().nextInt(students.length);
      while (students[randNum].successAttempts > 0) {
        randNum = Random().nextInt(students.length);
      }

      emit(StudentsLoaded(students: students, randNum: randNum));
    } catch (e) {
      emit(StudentsLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  void _onSelectFaculty(SelectFaculty event, Emitter<StudentsState> emit) {
    if (state is! StudentsLoaded) return;

    final currentState = state as StudentsLoaded;
    emit(StudentsLoading());

    final currentStudent = students[currentState.randNum];
    final isSelectionSuccess = currentStudent.house == event.selectedFaculty;

    final updatedStudent = currentStudent.copyWith(
      success: isSelectionSuccess ? currentStudent.successAttempts + 1 : currentStudent.successAttempts,
      failed: !isSelectionSuccess ? currentStudent.failedAttempts + 1 : currentStudent.failedAttempts,
    );

    students[currentState.randNum] = updatedStudent;
    HiveRepository().updateStudent(currentState.randNum, updatedStudent);

    emit(StudentsLoaded(
      students: students,
      randNum: currentState.randNum,
      isSelectionSuccess: isSelectionSuccess,
    ));

    _emitRandomStudent(emit);
  }

  Future<void> _emitRandomStudent(Emitter<StudentsState> emit) async {
    try {
      final randNum = Random().nextInt(students.length);
      emit(StudentsLoaded(students: students, randNum: randNum));
    } catch (e) {
      emit(StudentsLoadingFailure(exception: e));
    }
  }

  Future<void> _onResetAll(ResetAll event, Emitter<StudentsState> emit) async {
    if (state is! StudentsLoaded) return;

    emit(StudentsLoading());

    try {
      HiveRepository().resetAll();
      students = HiveRepository().getAllStudents();

      final randNum = Random().nextInt(students.length);
      emit(StudentsLoaded(students: students, randNum: randNum));
    } catch (e) {
      emit(StudentsLoadingFailure(exception: e));
    }
  }

  void _onLoadStudentAgain(LoadStudentAgain event, Emitter<StudentsState> emit) {
    if (state is! StudentsLoaded) return;

    try {
      emit(StudentsLoaded(students: students, randNum: event.index));
    } catch (e) {
      emit(StudentsLoadingFailure(exception: e));
    }
  }
}
