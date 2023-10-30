import 'package:hive/hive.dart';

part 'yoga_routine.g.dart';

@HiveType(typeId: 1)
class YogaRoutine {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  YogaRoutine({required this.title, required this.subtitle});
}