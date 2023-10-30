import 'package:hive/hive.dart';

part 'stress_reduction_routine.g.dart';

@HiveType(typeId: 0)
class StressReductionRoutine{

  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  StressReductionRoutine({required this.title, required this.subtitle});
}