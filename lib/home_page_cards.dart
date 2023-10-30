import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const HomePageCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 206, 212, 199),
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 73, 80, 66),
          width: 2.0
        ),
        borderRadius: BorderRadius.circular(10)
      ),
        child: Column(
          children: [
            SizedBox(
              height: 210,
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: const Color.fromARGB(255, 73, 80, 66),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
