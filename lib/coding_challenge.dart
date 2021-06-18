import 'package:coding_challenge/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'board_run.dart';

/// Main Widget of the Application containing all the BoardRuns in it
///
/// shows all [BoardRun]s that happened
class CodingChallenge extends StatefulWidget {
  @override
  CodingChallengeState createState() => CodingChallengeState();
}

class CodingChallengeState extends State<CodingChallenge> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Helper()..addItem(BoardRun(4.5, 10000)),
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Consumer<Helper>(builder: (context, helper, _) {
              return Column(children: context.watch<Helper>().allRuns);
            }),
          ),
        ),
      ),
    );
  }
}
