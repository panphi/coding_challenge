import 'dart:math';

import 'package:coding_challenge/bucket.dart';

class BoardRun {
  List<Bucket> buckets = [];

  final double fallPoint;
  final int ballAmount;
  final int amountOfBuckets = 10;

  BoardRun(this.fallPoint, this.ballAmount) {
    var distributedBalls = _distributeBalls();
    int index = 0;
    for (var amount in distributedBalls) {
      buckets.add(Bucket(amount, index));
      index++;
    }
  }

  List<int> _distributeBalls() {
    var randomGenerator = Random();
    var ballDistribution =
        List<int>.filled(amountOfBuckets, 0, growable: false);
    for (int i = 0; i < ballAmount; i++) {
      double position = fallPoint;
      //fix fall Position to not go over walls
      if (fallPoint == 0) {
        position += 0.5;
      } else if (fallPoint == 10) {
        position -= 0.5;
      }
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
      ballDistribution[position.round()] += 1;
    }
    return ballDistribution;
  }
}
