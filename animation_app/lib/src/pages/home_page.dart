import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Animations'),
        ),
        body: Container(
          height: _screenSize.height * 0.80,
          child: ListView(
            children: [
              btnPage(context, 'Animation Transform 1', 'animationTr1'),
              btnPage(context, 'Animation Transform 2', 'animationTr2'),
              btnPage(context, 'Shake Transitions Animation', 'shakeTrAnim1'),
              btnPage(context, 'Shiny Buttons', 'shinyBtn'),
              btnPage(context, 'TweenAnimationBuilder 1', 'tweenAnimationBld1'),
              btnPage(context, 'TweenAnimationBuilder 2', 'tweenAnimationBld2'),
              btnPage(context, 'TweenAnimationBuilder 3', 'tweenAnimationBld3'),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnPage(BuildContext context, String titleBtn, String page) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30),
      child: OutlinedButton(
        child: Text(titleBtn),
        onPressed: () {
          Navigator.pushNamed(context, page);
        },
      ),
    );
  }
}
