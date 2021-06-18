import 'package:coding_challenge/board_run.dart';
import 'package:flutter/material.dart';

import 'coding_challenge.dart';

/// class to communicate changes in the [runs] to all concerning Classes mainly [CodingChallenge]
class Helper with ChangeNotifier {
  List<BoardRun> runs = [];

  addItem(BoardRun run) {
    runs.add(run);
    notifyListeners();
  }

  get allRuns => runs;
}
