import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingIndicator(
              indicatorType: Indicator.pacman,
              backgroundColor: Colors.white,
              colors: [Colors.red, Colors.green, Colors.blue],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please wait...',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
