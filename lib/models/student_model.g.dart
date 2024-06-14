// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      name: fields[0] as String,
      dateOfBirth: fields[1] as String,
      actor: fields[2] as String,
      species: fields[3] as String,
      image: fields[4] as String,
      house: fields[5] as String,
      failedAttempts: fields[7] as int,
      successAttempts: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dateOfBirth)
      ..writeByte(2)
      ..write(obj.actor)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.house)
      ..writeByte(6)
      ..write(obj.successAttempts)
      ..writeByte(7)
      ..write(obj.failedAttempts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
