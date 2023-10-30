import 'package:flutter/material.dart';
import 'package:mindfulness_app/daily_affirmations.dart';
import 'package:mindfulness_app/exercise_regime.dart';
import 'package:mindfulness_app/home_page_cards.dart';
import 'package:mindfulness_app/yoga_exercises.dart';
import 'package:mindfulness_app/stress_reduction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stress B Gone"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                // direct user to page containing the yoga exercises
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const YogaExercises(),
                    ),
                  );
                },
                child: const HomePageCard(
                    title: "Yoga Exercises", icon: Icons.wb_sunny_rounded),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const StressReductionPage()),
                  );
                },
                child: const HomePageCard(
                  title: "Stress Reduction",
                  icon: Icons.accessibility,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DailyAffirmationsPage(),
                    ),
                  );
                },
                child: const HomePageCard(
                  title: "Daily Affirmations",
                  icon: Icons.fitness_center_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // direct user to the page containing info about their exercise routine
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ExerciseRegime(),
                    ),
                  );
                },
                child: const HomePageCard(
                  title: "My Regime",
                  icon: Icons.note_alt_sharp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
