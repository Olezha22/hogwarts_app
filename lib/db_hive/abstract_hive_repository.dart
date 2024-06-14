import 'package:hogwards_app/models/student_model.dart';

abstract class AbstractHiveRepository {
  Future<void> initHive();
  void addStudent(StudentModel studentModel);
  void addStudents(List<StudentModel> studentModels);
  List<StudentModel> getAllStudents();
  bool hasStudents();
  Future<void> updateStudent(int index, StudentModel studentModel);
  void resetAll();
}
