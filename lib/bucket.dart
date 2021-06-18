import 'board_run_widget.dart';

/// Data Representation for a Bucket
/// contains the [ballAmount] which are in this [Bucket] and the [index] (position)
/// which it has in its [BoardRunWidget]
class Bucket {
  final int ballAmount;
  final int index;

  Bucket(this.ballAmount, this.index);
}
