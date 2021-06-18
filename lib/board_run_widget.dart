import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bucket.dart';
import 'helper.dart';

/// Widget to display a single BoardRun and the Buckets with all their balls
///
/// Upon Creation of a BoardRun the distribution get's executed
class BoardRun extends StatefulWidget {
  final double fallPoint;
  final int ballAmount;
  final int amountOfBuckets = 10;

  BoardRun(this.fallPoint, this.ballAmount);

  @override
  _BoardRunState createState() => _BoardRunState();
}

class _BoardRunState extends State<BoardRun> {
  List<Bucket> buckets = [];
  bool areButtonsDisabled;

  initState() {
    super.initState();
    print('init');
    areButtonsDisabled = false;
    var distributedBalls = _distributeBalls();
    int index = 0;
    for (var amount in distributedBalls) {
      buckets.add(Bucket(amount, index));
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: createBuckets(),
    );
  }

  List<int> _distributeBalls() {
    var randomGenerator = Random();
    var ballDistribution =
        List<int>.filled(widget.amountOfBuckets, 0, growable: false);
    for (int i = 0; i < widget.ballAmount; i++) {
      double position = widget.fallPoint.toDouble();
      //fix fall Position to not go over walls
      if (widget.fallPoint == 0) {
        position += 0.5;
      } else if (widget.fallPoint == 10) {
        position -= 0.5;
      }
      for (int y = 0; y < widget.amountOfBuckets - 1; y++) {
        if (randomGenerator.nextDouble() > 0.5) {
          // check right wall "drop"
          if (position == widget.amountOfBuckets - 1.5) {
            position = widget.amountOfBuckets.toDouble() - 1;
            break;
          }
          position += 0.5;
        } else {
          //check left wall "drop"
          if (position == 0.5) {
            position = 0;
            break;
          }
          position -= 0.5;
        }
      }
      ballDistribution[position.round()] += 1;
    }
    return ballDistribution;
  }

  List<Widget> createBuckets() {
    print('create');
    List<Widget> widgets = [];
    for (Bucket bucket in buckets) {
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
    helper.addItem(BoardRun(bucket.index.toDouble(), bucket.ballAmount));
  }
}
