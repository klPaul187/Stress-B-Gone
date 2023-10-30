import 'package:flutter/material.dart';
import 'package:mindfulness_app/global_variables.dart';
import 'package:mindfulness_app/main.dart';
import 'package:mindfulness_app/stress_reduction_routine.dart';
import 'package:mindfulness_app/yoga_routine.dart';

class ExerciseRegime extends StatefulWidget {
  const ExerciseRegime({super.key});
  @override
  State<ExerciseRegime> createState() => _ExerciseRegimeState();
}

class _ExerciseRegimeState extends State<ExerciseRegime> {
  @override
  Widget build(BuildContext context) {
    List<YogaRoutine> yogaRoutine = yogaBox.values.cast<YogaRoutine>().toList();
    List<StressReductionRoutine> stressReductionRoutine =
        stress_reduction_box.values.cast<StressReductionRoutine>().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My regime'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yogaRoutine.isEmpty
                ? Text(
                    "You have not added any yoga exercises yet!",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    "My Daily Yoga Regime",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: yogaRoutine.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.fitbit,
                    color: Color.fromARGB(255, 73, 80, 66),
                  ),
                  title: Text(
                    yogaRoutine[index].title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    yogaRoutine[index].subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        yoga_exercises[index]['isInRoutine'] = false;
                        yogaBox.deleteAt(index);
                      });
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Color.fromARGB(255, 73, 80, 66),
                    ),
                  ),
                );
              },
            ),
            stressReductionRoutine.isEmpty
                ? Text(
                    "You have not added any stress reductions techniques yet!",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    "My Daily Stress Reduction Routine",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: stressReductionRoutine.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.fitbit,
                    color: Color.fromARGB(255, 73, 80, 66),
                  ),
                  title: Text(
                    stressReductionRoutine[index].title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    stressReductionRoutine[index].subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        stress_reduction_box.deleteAt(index);
                      });
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Color.fromARGB(255, 73, 80, 66),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
