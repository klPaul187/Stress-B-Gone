import 'package:flutter/material.dart';
import 'package:mindfulness_app/main.dart';
import 'package:mindfulness_app/stress_reduction_routine.dart';

class StressReductionPage extends StatelessWidget {
  const StressReductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress Reduction Technique'),
      ),
      body: const ArticleList(),
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ArticleBox(
          title: 'Visualization of Future Goals',
          subtitle: 'Your daily dose of inspiration!',
          content:
              'Visualization is the practice of imagining what you want to achieve in the future. Here are some visualization techniques: \n 1) Outcome Visualization: Often referred to as guided imagery or mental rehearsal, is a technique used in stress reduction and relaxation. It involves creating a mental image of a desired outcome or a peaceful and calming scenario to help reduce stress and anxiety. \n 2)Process Visualization: Involves imagining every step required to reach a desired outcome while engaging all the senses. This detailed mental rehearsal can be a highly effective method for reducing stress and increasing confidence and preparedness.  ',
          imageUrl: 'assets/images/visualize.png',
        ),
        ArticleBox(
          title: 'Progressive Muscle Relaxation',
          subtitle: "Relief Time!!",
          content:
              'Progressive Muscle Relaxation (PMR) is a stress reduction technique that involves systematically tensing and then relaxing different muscle groups in the body to promote relaxation. Here are the key steps for PMR: \n 1)Preparation: Find a quiet, comfortable place to sit or lie down. Remove distractions and loosen any tight clothing. \n 2)Focus: Close your eyes and take a few deep breaths to help center yourself. Concentrate on the present moment and your intention to relax. \n 3)Muscle Group Selection: Start at either your toes or your head and work your way through the body systematically. You can choose the order that feels most comfortable to you. 4)Tensing: Focus on one muscle group at a time. Tense the muscles in that group as tightly as you can for about 5-10 seconds. For example, if youre starting with your toes, curl them downward. \n 5)Release: Suddenly release the tension in the muscle group and let it relax completely. Pay attention to the sensation of relaxation as the tension fades away.  ',
          imageUrl: 'assets/images/relax.png',
        ),
        ArticleBox(
          title: 'Music Therapy',
          subtitle: "Your daily jingle!",
          content:
              'Music therapy involves using a person’s responses and connections to music to encourage positive changes in mood and overall well-being. It can decrease anxiety and improve self-esteem.\n Here are some benefits: \n - Relaxation Response: Slow, calming music can trigger the relaxation response in the body, leading to reduced heart rate, lowered blood pressure, and decreased muscle tension. \n - Distraction and Coping: Music can serve as a distraction from stressors and a healthy coping mechanism. It redirects attention away from stress and offers an alternative focus. \n - Group or Individual Sessions: Music therapy can be administered in both group and individual settings, making it accessible and adaptable to various needs and preferences. \n -Expression and Communication: Music can provide an outlet for self-expression, especially when words are hard to find. This can reduce internal tension and stress.',
          imageUrl: 'assets/images/music.png',
        ),
      ],
    );
  }
}

class ArticleBox extends StatefulWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String subtitle;

  ArticleBox({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.subtitle,
  });

  @override
  _ArticleBoxState createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  bool _isExpanded = false;
  bool isInHive = false; // Flag to check if the object is in Hive

  @override
  void initState() {
    super.initState();
    // Check if the object is in Hive
    if (stress_reduction_box.values
        .any((exercise) => exercise.title == widget.title)) {
      setState(() {
        isInHive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 206, 212, 199),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(widget.title,
                style: Theme.of(context).textTheme.titleMedium),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Column(
              children: [
                const Divider(
                  color: Color.fromARGB(255, 0, 0, 0),
                  thickness: 1,
                ),
                Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.content,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                isInHive
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Part of your routine",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                              color: Color.fromARGB(255, 206, 212, 199),
                              backgroundColor: Color.fromARGB(255, 73, 80, 66),
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 73, 80, 66),
                            ),
                          ),
                          onPressed: () {
                            StressReductionRoutine newStressReductionExercise =
                                StressReductionRoutine(
                                    title: widget.title,
                                    subtitle: widget.subtitle);
                            setState(() {
                              stress_reduction_box
                                  .add(newStressReductionExercise);
                              isInHive = true;
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
                      ),
              ],
            ),
        ],
      ),
    );
  }
}
