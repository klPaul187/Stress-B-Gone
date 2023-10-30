import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mindfulness_app/home_page.dart';
import 'package:mindfulness_app/stress_reduction_routine.dart';
import 'package:mindfulness_app/yoga_routine.dart';

late Box yogaBox;
late Box stress_reduction_box;

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(YogaRoutineAdapter());
  yogaBox = await Hive.openBox('yogaBox');

  Hive.registerAdapter(StressReductionRoutineAdapter());
  stress_reduction_box = await Hive.openBox('stressReductionBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stress B Gone',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 73, 80, 66),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 206, 212, 199) ,
              fontSize: 30),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Color.fromARGB(255, 73, 80, 66),
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: Color.fromARGB(255, 73, 80, 66),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
