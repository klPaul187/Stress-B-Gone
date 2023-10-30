import 'package:flutter/material.dart';
import 'package:mindfulness_app/global_variables.dart';
import 'package:mindfulness_app/main.dart';
import 'package:mindfulness_app/yoga_routine.dart';

class YogaExercises extends StatefulWidget {
  const YogaExercises({super.key});

  @override
  State<YogaExercises> createState() => _YogaExercisesState();
}

class _YogaExercisesState extends State<YogaExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yoga Exercises"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: yoga_exercises.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: const Color.fromARGB(255, 206, 212, 199),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(yoga_exercises[index]['title'],
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: yoga_exercises[index]['instructions']
                          .map<Widget>((instruction) {
                        return Text(instruction,
                            style: Theme.of(context).textTheme.bodySmall);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(yoga_exercises[index]['image']),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: yoga_exercises[index]['isInRoutine']
                          ? const Text(
                              "Part of your routine",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                                color: Color.fromARGB(255, 206, 212, 199),
                                backgroundColor:
                                    Color.fromARGB(255, 73, 80, 66),
                              ),
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(8),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 73, 80, 66),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                final YogaRoutine newExercise = YogaRoutine(
                                  title: yoga_exercises[index]['title'],
                                  subtitle: yoga_exercises[index]['subtitle'],
                                );
                                setState(() {
                                  yoga_exercises[index]['isInRoutine'] = true;
                                  yogaBox.put(index, newExercise);
                                });
                              },
                              child: const Text(
                                "Add to routine",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 206, 212, 199),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
