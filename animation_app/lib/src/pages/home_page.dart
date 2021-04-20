import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: Container(
          height: _screenSize.height * 0.80,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 30),
                child: OutlinedButton(
                  child: Text('Animation Transform 1'),
                  onPressed: (){
                    Navigator.pushNamed(context, 'animationTr1');
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 30),
                child: OutlinedButton(
                  child: Text('Animation Transform 2'),
                  onPressed: (){
                    Navigator.pushNamed(context, 'animationTr2');
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
