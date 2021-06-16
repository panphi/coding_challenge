import 'package:flutter/material.dart';

class Bucket extends StatefulWidget {
  final int ballAmount;

  Bucket(this.ballAmount);

  @override
  _BucketState createState() => _BucketState();
}

class _BucketState extends State<Bucket> {
  bool isButtonDisabled;

  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isButtonDisabled
            ? null
            : () {
                print('new Run');
              },
        child: Text('${widget.ballAmount}'));
  }
}
