import 'package:dio/dio.dart';
import 'package:hogwards_app/models/student_model.dart';
import 'package:hogwards_app/repositories/abstract_student_repository.dart';

class StudentRepository implements AbstractStudentRepository {
  final Dio dio = Dio();
  final String url = 'https://hp-api.onrender.com/api/characters';

  @override
  Future<List<StudentModel>> fetchAllStudents() async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data
            .map((student) =>
                StudentModel.fromJson(student as Map<String, dynamic>))
            .where((student) => student.image.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      throw Exception('Failed to load students: $e');
    }
  }

  @override
  int calculateSuccessAttempts(List<StudentModel> students) {
    int success = 0;
    for (var i = 0; i < students.length; i++) {
      if (students[i].successAttempts != 0) {
        success += students[i].successAttempts;
      }
    }
    return success;
  }

  @override
  int calculatefailedAttempts(List<StudentModel> students) {
    int failed = 0;
    for (var i = 0; i < students.length; i++) {
      if (students[i].failedAttempts != 0) {
        failed += students[i].failedAttempts;
      }
    }
    return failed;
  }
}
