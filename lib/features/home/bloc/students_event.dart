part of 'students_bloc.dart';

abstract class StudentsEvent extends Equatable {}

class LoadStudents extends StudentsEvent {
  LoadStudents({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class LoadRandomStudent extends StudentsEvent {
  LoadRandomStudent({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class SelectFaculty extends StudentsEvent {
  final String selectedFaculty;

  SelectFaculty({required this.selectedFaculty});

  @override
  List<Object> get props => [selectedFaculty];
}

class ResetAll extends StudentsEvent {
  @override
  List<Object> get props => [];
}

class LoadStudentAgain extends StudentsEvent {
  final int index;

  LoadStudentAgain({required this.index});

  @override
  List<Object> get props => [];
}
