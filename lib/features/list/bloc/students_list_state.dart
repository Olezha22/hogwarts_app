part of 'students_list_bloc.dart';


abstract class StudentsListState extends Equatable {}

class StudentsListInitial extends StudentsListState {
  @override
  List<Object?> get props => [];
}

class StudentsListLoading extends StudentsListState {
  @override
  List<Object?> get props => [];
}

class StudentsListLoaded extends StudentsListState {
  final List<StudentModel> students;
  final List<int> indexes;

  StudentsListLoaded({
    required this.students,
    required this.indexes,
  });

  @override
  List<Object> get props => [students];
}

class StudentsListLoadingFailure extends StudentsListState {
  StudentsListLoadingFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
