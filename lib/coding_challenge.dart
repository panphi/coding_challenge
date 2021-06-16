import 'package:flutter/material.dart';

import 'board_run.dart';

class CodingChallenge extends StatefulWidget {
  @override
  _CodingChallengeState createState() => _CodingChallengeState();
}

class _CodingChallengeState extends State<CodingChallenge> {
  List<BoardRun> runs = [BoardRun(4.5, 10000)];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Column(
          children: runs,
        ),
      ),
    ));
  }

  void addNewRun() {}
}
