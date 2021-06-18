import 'dart:math';

import 'package:coding_challenge/bucket.dart';

/// class to simulate a BoardRun
///
/// contains the Buckets for witch the ball distribution is done with [_distributeBalls]
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

  /// distributes the balls over the Buckets
  ///
  /// each ball gets simulated individually. It will fall over [amountOfBuckets] -1
  /// "sticks". on each one it has a 50/50 chance to go either left or right.
  /// If the random Number is 0.5 or bigger it will go right otherwise it will go left.
  /// Emulated by changing the position.
  /// The rounded position number it has after falling over all sticks indicates the
  /// index of the Bucket it falls to.
  /// At the left and right most ends there's a wall. If the balls don't fall in the middle
  /// they can "walldrop" meaning if they go right on the right most stick or left
  /// on the left most respectively, they'd fall all the way down to the corresponding
  /// bucket
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
        if (randomGenerator.nextDouble() >= 0.5) {
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
