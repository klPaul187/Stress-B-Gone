// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_routine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YogaRoutineAdapter extends TypeAdapter<YogaRoutine> {
  @override
  final int typeId = 1;

  @override
  YogaRoutine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YogaRoutine(
      title: fields[0] as String,
      subtitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, YogaRoutine obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YogaRoutineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
