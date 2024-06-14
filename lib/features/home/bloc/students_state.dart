part of 'students_bloc.dart';

abstract class StudentsState extends Equatable {}

class StudentsInitial extends StudentsState {
  @override
  List<Object?> get props => [];
}

class StudentsLoading extends StudentsState {
  @override
  List<Object?> get props => [];
}

class StudentsLoaded extends StudentsState {
  final List<StudentModel> students;
  final int randNum;
  final bool? isSelectionSuccess;

  StudentsLoaded({
    required this.students,
    required this.randNum,
    this.isSelectionSuccess,
  });

  @override
  List<Object> get props => [students, randNum, isSelectionSuccess ?? false];
}

class StudentsLoadingFailure extends StudentsState {
  StudentsLoadingFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
