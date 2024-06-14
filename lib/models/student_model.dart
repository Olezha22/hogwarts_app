import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends Equatable {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dateOfBirth;

  @HiveField(2)
  final String actor;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final String house;

  @HiveField(6)
  final int successAttempts;

  @HiveField(7)
  final int failedAttempts;

  const StudentModel({
    required this.name,
    required this.dateOfBirth,
    required this.actor,
    required this.species,
    required this.image,
    required this.house,
    required this.failedAttempts,
    required this.successAttempts,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      actor: json['actor'] ?? '',
      species: json['species'] ?? '',
      image: json['image'] ?? '',
      house: json['house'] ?? '',
      failedAttempts: 0,
      successAttempts: 0,
    );
  }

  StudentModel copyWith({int? success, int? failed}) {
    return StudentModel(
      name: name,
      dateOfBirth: dateOfBirth,
      actor: actor,
      species: species,
      image: image,
      house: house,
      failedAttempts: failed ?? failedAttempts,
      successAttempts: success ?? successAttempts,
    );
  }

  @override
  List<Object?> get props => [
        name,
        dateOfBirth,
        actor,
        species,
        image,
        house,
        failedAttempts,
        successAttempts,
      ];
}
