import 'package:coding_challenge/board_run_widget.dart';
import 'package:flutter/material.dart';

import 'coding_challenge.dart';

/// class to communicate changes in the [runs] to all concerning Classes mainly [CodingChallenge]
class Helper with ChangeNotifier {
  List<BoardRunWidget> runs = [];

  addItem(BoardRunWidget run) {
    runs.add(run);
    notifyListeners();
  }

  get allRuns => runs;
}
