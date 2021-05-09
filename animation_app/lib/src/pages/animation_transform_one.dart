import 'dart:math';

import 'package:flutter/material.dart';

class AnimationTrPageOne extends StatefulWidget {
  _AnimationTransformState createState() => _AnimationTransformState();
}

class _AnimationTransformState extends State<AnimationTrPageOne> {
  double _sliderValue= 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation using Transform 1 - Image with Slide'),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity() //Hacer uso de varios transform a la vez
                ..rotateY(pi*_sliderValue)//Rotaci[on en Y
                ..setEntry(3, 2, 0.0024),//Dar un efecto 3D
                child: Image.asset('assets/fcb.png',
                height: 210),
              ),
              SizedBox(height: 20,),
              Slider(value: _sliderValue,
                  onChanged: (val){
                setState(() {
                  _sliderValue=val;
                });
              }), 
              Text('Value: ${_sliderValue.toStringAsFixed(1)}')
            ],
          ),
        ));
  }
}
