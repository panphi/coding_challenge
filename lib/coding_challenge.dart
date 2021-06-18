import 'package:coding_challenge/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'board_run_widget.dart';
import 'curve_drawing.dart';

/// Main Widget of the Application containing all the BoardRuns in it
///
/// shows all [BoardRunWidget]s that happened
class CodingChallenge extends StatefulWidget {
  @override
  CodingChallengeState createState() => CodingChallengeState();
}

class CodingChallengeState extends State<CodingChallenge> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Helper()..addItem(BoardRunWidget(4.5, 10000)),
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Consumer<Helper>(builder: (context, helper, _) {
                  return Column(children: context.watch<Helper>().allRuns);
                }),
                Consumer<Helper>(builder: (context, helper, _) {
                  return CurveDrawing(context.watch<Helper>().allRuns.last);
                })
                // CurveDrawing()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
