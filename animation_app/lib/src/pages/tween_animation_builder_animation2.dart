import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderAnimationTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TweenAnimationBuilderAnimationTwo'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 3),
                    child: Text('Fc Barcelona',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: -pi / value,
                        origin: Offset(0.0, 1.0),
                        child: child,
                      );
                    }),
                const SizedBox(
                  height: 14.0,
                ),
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.bounceInOut,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/fcb.png'),
                      radius: 50,
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(200 * value, 0.0),
                        child: child,
                      );
                    }),
                const SizedBox(
                  height: 16.0,
                ),
                TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceInOut,
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0.0, 300 * value),
                        child: child,
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
