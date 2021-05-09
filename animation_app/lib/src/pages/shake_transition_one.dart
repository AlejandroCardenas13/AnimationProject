import 'package:flutter/material.dart';

class MainShakeTransitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Shake Transitions'),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShakeTransition(
                    child: Text(
                  'Hello Flutter!!',
                  style: Theme.of(context).textTheme.headline3,
                )),
                const SizedBox(height: 20.0),
                ShakeTransition(
                    axis: Axis.vertical,
                    duration: const Duration(milliseconds: 1500),
                    child: ElevatedButton(
                      onPressed: () => null,
                      child: Text('Press me!'),
                    )),
                const SizedBox(height: 20.0),
                ShakeTransition(
                    axis: Axis.vertical,
                    duration: const Duration(milliseconds: 1100),
                    offSet: 300,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                    ))
              ],
            ),
          ),
        ));
  }
}

class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {Key key,
      this.duration = const Duration(milliseconds: 900),
      this.offSet = 140.0,
      this.axis = Axis.horizontal,
      @required this.child})
      : super(key: key);
  final Widget child;
  final Duration duration;
  final double offSet;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.bounceOut,
      //curve: Curves.elasticOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
            offset: axis == Axis.horizontal
                ? Offset(value * offSet, 0.0)
                : Offset(0.0, value * offSet),
            child: child);
      },
    );
  }
}
