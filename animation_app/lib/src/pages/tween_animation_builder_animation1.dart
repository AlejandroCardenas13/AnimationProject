import 'package:flutter/material.dart';

class TweenAnimationBuilderAnimationOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder Animation One'),
      ),
      body: Center(
          child: TweenAnimationBuilder<Color>(
              duration: const Duration(seconds: 2),
              tween: ColorTween(
                  begin: Colors.cyanAccent, end: Colors.deepOrangeAccent),
              builder: (context, value, _) {
                return Container(
                  height: 250,
                  width: 250,
                  color: value,
                );
              })),
    );
  }
}
