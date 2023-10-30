// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_reduction_routine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StressReductionRoutineAdapter
    extends TypeAdapter<StressReductionRoutine> {
  @override
  final int typeId = 0;

  @override
  StressReductionRoutine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StressReductionRoutine(
      title: fields[0] as String,
      subtitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StressReductionRoutine obj) {
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
      other is StressReductionRoutineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
