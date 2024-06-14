import 'package:hive_flutter/hive_flutter.dart';
import 'package:hogwards_app/db_hive/abstract_hive_repository.dart';
import 'package:hogwards_app/models/student_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveRepository implements AbstractHiveRepository{
   @override
  Future<void> initHive() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(applicationDocumentDir.path);
    Hive.registerAdapter(StudentModelAdapter());

    await Hive.openBox<StudentModel>('students');
  }

   @override
  void addStudent(StudentModel studentModel) {
    Hive.box<StudentModel>('students').add(studentModel);
  }

   @override
  void addStudents(List<StudentModel> studentModels) {
    var box = Hive.box<StudentModel>('students');
    for (var student in studentModels) {
      box.add(student);
    }
  }

   @override
  List<StudentModel> getAllStudents() {
    return Hive.box<StudentModel>('students').values.toList();
  }

   @override
  bool hasStudents() {
    var studentBox = Hive.box<StudentModel>('students');
    return studentBox.isNotEmpty;
  }

   @override
  Future<void> updateStudent(
      int index, StudentModel studentModel) async {
    await Hive.box<StudentModel>('students').putAt(index, studentModel);
  }

   @override
  void resetAll() {
    var studentBox = Hive.box<StudentModel>('students');
    for (var i = 0; i < studentBox.length; i++) {
      var student = studentBox.getAt(i)!;
      student = student.copyWith(success: 0, failed: 0);
      studentBox.putAt(i, student);
    }
  }
}
