import 'package:flutter/material.dart';
import 'dart:async';

//Author: Humayra Hussain
//Page: Daily Affirmation Page

class DailyAffirmationsPage extends StatefulWidget {
  const DailyAffirmationsPage({super.key});

  @override
  State<DailyAffirmationsPage> createState() => _DailyAffirmationsPage();
}

class _DailyAffirmationsPage extends State<DailyAffirmationsPage> {
  int selectedMinutes = 3; //placeholder for the dropdown menu
  int secondsLeft = 0; //placeholder for the secondsLeft countdown
  late Timer _timer; //timer object
  String affirmation = 'I am brave';

  void startTimer() {
    setState(() {
      secondsLeft = selectedMinutes * 60; //converts minutes to seconds
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (secondsLeft == 0) {
          //if there are 0 seconds left...
          timer.cancel(); //cancel the timer to end it.
        } else {
          setState(() {
            //otherwise...
            secondsLeft--; // decrement the secondsLeft.
          });
        }
      });
    });
  }

  void pauseTimer() {
    //once the timer is paused, we cancel the timer to reset the time.
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  void resetTimer() {
    //upon clicking the reset button, we reset the timer and secondsLeft to 0.
    if (_timer.isActive) {
      //this is here in case we do not hit pause and just click the reset button!
      _timer.cancel();
    }
    setState(() {
      secondsLeft = 0;
    });
  }

  void changeAffirmation(affirmation) {
    //this method will be called when the new affirmation button is pressed
    List<String> affirmations = [
      "I love myself",
      "I am unique",
      "I am smart",
      "I matter",
      "I am strong",
      "I am a good person",
      "I believe I can do anything",
      "I accept myself",
      "I can make a difference",
      "I deserve good things in life",
      "I radiate brilliance",
      "I deserve happiness",
      "I am loved",
      "I am kind"
    ];

    String newAffirmation;
    do {
      //do while loop to ensure that the new affirmation is not the same as the old one
      //below line generates a random index to select a new affirmation
      int randomIndex = DateTime.now().millisecondsSinceEpoch %
          affirmations.length; //random index
      newAffirmation = affirmations[randomIndex];
    } while (newAffirmation ==
        this.affirmation); //if the new affirmation is the same as the old one, we generate a new one
    setState(() {
      //set the state of the affirmation to the new affirmation
      this.affirmation = newAffirmation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Affirmations',
          style: TextStyle(color: Color.fromARGB(255, 73, 80, 66)),
        ),
         backgroundColor: const Color.fromARGB(255, 206, 212, 199),
      ),

      // ignore: prefer_const_constructors
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 114, 123, 103),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 206, 212, 199),
                width: 3.0,
              ),
            ),
            //color: const Color.fromARGB(255, 114, 123, 103), //container color!
            //below we will place a column within the container as its child
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<int>(
                        //dropdown menu for the timer
                        value:
                        selectedMinutes, //selectedMinutes variable we made earlier
                        items: [3, 5, 8].map((int value) {
                          //items to store within the selectedMinutes
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value minutes',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 201, 201, 167),
                                    fontSize: 15)),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          setState(() {
                            selectedMinutes = newValue ?? 3;
                          });
                        },
                      ),
                      const SizedBox(
                          width:
                          20), //puts space between dropdown and time remaining variable
                      Text(
                        'Time remaining: $secondsLeft seconds',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 201, 201, 167)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  //putting buttons in a row
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: startTimer,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromARGB(255, 206, 212, 199)),
                      child: const Text('Start',
                          style: TextStyle(
                              color: Color.fromARGB(255, 73, 80, 66))),
                    ),
                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: pauseTimer,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromARGB(255, 206, 212, 199)),
                      child: const Text('Pause',
                          style: TextStyle(
                              color: Color.fromARGB(255, 73, 80, 66))),
                    ),
                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: resetTimer,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromARGB(255, 206, 212, 199)),
                      child: const Text('Reset',
                          style: TextStyle(
                              color: Color.fromARGB(255, 73, 80, 66))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //putting another container in here to represent the daily affirmations!
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 206, 212, 199),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 73, 80, 66),
                width: 3.0,
              ),
            ),
            //color: const Color.fromARGB(255, 206, 212, 199),
            // ignore: prefer_const_constructors
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //may need to remove const later.
                Text(
                  affirmation, //string stored within affirmation variable!
                  style: const TextStyle(
                    color: Color.fromARGB(255, 73, 80, 66),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    changeAffirmation(affirmation);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 73, 80, 66)),
                  child: const Text(
                    'new affirmation',
                    style: TextStyle(
                      color: Color.fromARGB(255, 201, 201, 167),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
