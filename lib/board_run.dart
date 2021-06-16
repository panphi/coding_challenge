import 'dart:math';

import 'package:flutter/material.dart';

import 'bucket.dart';

class BoardRun extends StatefulWidget {
  final double fallPoint;
  final int ballAmount;
  final int amountOfBuckets = 10;

  BoardRun(this.fallPoint, this.ballAmount);

  @override
  _BoardRunState createState() =>
      _BoardRunState(fallPoint, ballAmount, amountOfBuckets);
}

class _BoardRunState extends State<BoardRun> {
  List<Bucket> buckets = [];
  final double fallPoint;
  final int ballAmount;
  final int amountOfBuckets;

  _BoardRunState(this.fallPoint, this.ballAmount, this.amountOfBuckets) {
    var distributedBalls = _distributeBalls();

    for (var amount in distributedBalls) {
      buckets.add(Bucket(amount));
      print('amount : $amount ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buckets,
    );
  }

  List<int> _distributeBalls() {
    print('hellloooooooo');
    var randomGenerator = Random();
    var ballDistribution =
        List<int>.filled(amountOfBuckets, 0, growable: false);
    for (int i = 0; i < ballAmount; i++) {
      double position = fallPoint.toDouble();
      for (int y = 0; y < amountOfBuckets - 1; y++) {
        if (randomGenerator.nextDouble() > 0.5) {
          // check right wall "drop"
          if (position == amountOfBuckets - 1.5) {
            position = amountOfBuckets.toDouble() - 1;
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
      ballDistribution[position.round()] +=
          1; // ballDistribution[position] + 1;
    }
    return ballDistribution;
  }
}
