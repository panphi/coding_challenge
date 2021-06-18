import 'package:coding_challenge/board_run.dart';
import 'package:coding_challenge/board_run_widget.dart';
import 'package:flutter/material.dart';

/// Widget to draw the 'curve' of a [BoardRun]
class CurveDrawing extends StatelessWidget {
  final BoardRunWidget currentRun;

  CurveDrawing(this.currentRun);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //TODO: not just random numbers
      size: Size(600, 200),
      painter: CurvePainter(currentRun.run),
    );
  }
}

class CurvePainter extends CustomPainter {
  BoardRun currentRun;

  CurvePainter(this.currentRun);

  /// draws a line of the amount of balls per [Bucket] relative to the overall
  /// amount of Balls that fell in the [currentRun]
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.pink;
    paint.strokeWidth = 30;

    var heightPartition = size.height / currentRun.ballAmount;
    var widthPartition = size.width / currentRun.amountOfBuckets;

    print('height: $heightPartition, widht: $widthPartition');

    for (var bucket in currentRun.buckets) {
      print(
          'bucket widht: ${widthPartition * bucket.index}, height: ${size.height - heightPartition * bucket.ballAmount}');
      canvas.drawLine(
        Offset(widthPartition * bucket.index, size.height),
        Offset(widthPartition * bucket.index,
            size.height - heightPartition * bucket.ballAmount),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
