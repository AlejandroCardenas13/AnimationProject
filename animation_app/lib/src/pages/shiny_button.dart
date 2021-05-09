import 'package:flutter/material.dart';

class MainShinyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shiny Buttons'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShinyButton(
              color: Colors.deepOrange,
              child: Text('Hello Flutter!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 30)),
              duration: const Duration(milliseconds: 900),
              onTap: () => print('ON TAAPP!!!'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShinyButton extends StatefulWidget {
  const ShinyButton(
      {Key key,
      this.duration = const Duration(milliseconds: 900),
      @required this.child,
      this.color = Colors.blueAccent,
      this.onTap})
      : super(key: key);
  final Widget child;
  final Duration duration;
  final Color color;
  final VoidCallback onTap;

  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: widget.child,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [widget.color, Colors.white, widget.color],
                    stops: [0.0, _animationController.value, 1.0])),
          );
        },
      ),
    );
  }
}
