import 'package:flutter/material.dart';
import 'dart:math';

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() {
    return _RockPaperScissors();
  }
}

class _RockPaperScissors extends State<RockPaperScissors> {
  String userChoice = '❓';
  String computerChoice = '❓';
  String result = '';
  int userScore = 0;
  int computerScore = 0;
  final List<String> choices = ['✊', '🤚', '✌'];

  void userChoiceMade(String choice) {
    String compChoice = choices[Random().nextInt(3)];
    String gameResult = getResult(choice, compChoice);

    setState(() {
      userChoice = choice;
      computerChoice = compChoice;
      result = gameResult;
    });
  }

  String getResult(String user, String comp) {
    if (user == comp) {
      return 'It is a Tie 😐';
    } else if ((user == '✊' && comp == '✌') ||
        (user == '🤚' && comp == '✊') ||
        (user == '✌' && comp == '🤚')) {
      userScore++;
      return 'You Win 😎';
    } else {
      computerScore++;
      return 'You Lose 😥';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const SizedBox(height: 30),
        Text('You: $userChoice', style: const TextStyle(fontSize: 25)),
        Text('Computer: $computerChoice', style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => userChoiceMade('✊'),
              child: Image.asset('assets/images/1.png', width: 90, height: 90),
            ),

            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => userChoiceMade('✌'),
              child: Image.asset('assets/images/2.png', width: 90, height: 90),
            ),

            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => userChoiceMade('🤚'),
              child: Image.asset('assets/images/3.png', width: 90, height: 90),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(result, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 20),
        Text(
          'Your Score: $userScore    Computer Score: $computerScore',
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        IconButton(
          onPressed: () {
            setState(() {
              userChoice = '❓';
              computerChoice = '❓';
              result = '';
              userScore = 0;
              computerScore = 0;
            });
          },
          icon: const Icon(Icons.restart_alt),
        ),
      ],
    );
  }
}
