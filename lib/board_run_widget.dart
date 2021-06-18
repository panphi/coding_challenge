import 'package:coding_challenge/board_run.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bucket.dart';
import 'helper.dart';

/// Widget to display a single BoardRun and the Buckets with all their balls
///
/// Upon Creation of a BoardRun the distribution get's executed
class BoardRunWidget extends StatefulWidget {
  final double fallPoint;
  final int ballAmount;
  final int amountOfBuckets = 10;
  final BoardRun run;

  BoardRunWidget(this.fallPoint, this.ballAmount)
      : run = BoardRun(fallPoint, ballAmount);

  @override
  _BoardRunWidgetState createState() => _BoardRunWidgetState();
}

class _BoardRunWidgetState extends State<BoardRunWidget> {
  List<Bucket> buckets = [];
  bool areButtonsDisabled;

  initState() {
    super.initState();
    areButtonsDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: createBuckets(),
    );
  }

  List<Widget> createBuckets() {
    print('create');
    List<Widget> widgets = [];
    for (Bucket bucket in widget.run.buckets) {
      widgets.add(createBucket(bucket));
    }
    return widgets;
  }

  Widget createBucket(Bucket bucket) {
    return Consumer<Helper>(builder: (context, helper, _) {
      return ElevatedButton(
          onPressed:
              areButtonsDisabled ? null : () => newBoardRun(helper, bucket),
          child: Text('${bucket.ballAmount}'));
    });
  }

  newBoardRun(Helper helper, Bucket bucket) {
    areButtonsDisabled = true;
    helper.addItem(BoardRunWidget(bucket.index.toDouble(), bucket.ballAmount));
  }
}
