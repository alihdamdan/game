import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/rock_paper_scissors.dart';

class RockPaper extends StatelessWidget{
  const RockPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(top: 50.0),
        child: Text('Let\'s play Rock-Paper-Scissors!',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        )
        ),
        ),
        const SizedBox(height: 100),
        RockPaperScissors(),
      ],
    );
  }
}