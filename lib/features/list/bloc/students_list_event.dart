part of 'students_list_bloc.dart';



abstract class StudentsListEvent extends Equatable {}

class LoadStudentsList extends StudentsListEvent{
  LoadStudentsList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}


class ResetAll extends StudentsListEvent {
  
  @override
  List<Object> get props => [];
}

class SearchStudents extends StudentsListEvent {
  final String query;

  SearchStudents(this.query);

  @override
  List<Object> get props => [query];
}
