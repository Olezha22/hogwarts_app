import 'package:hogwards_app/models/student_model.dart';

abstract class AbstractStudentRepository {
  Future<List<StudentModel>> fetchAllStudents();
  int calculateSuccessAttempts(List<StudentModel> students);
  int calculatefailedAttempts(List<StudentModel> students);
}
