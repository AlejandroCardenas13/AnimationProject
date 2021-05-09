import 'package:animation_app/src/pages/animation_transform_two.dart';
import 'package:animation_app/src/pages/shake_transition_one.dart';
import 'package:animation_app/src/pages/shiny_button.dart';
import 'package:animation_app/src/pages/tween_animation_builder_animation1.dart';
import 'package:animation_app/src/pages/tween_animation_builder_animation2.dart';
import 'package:animation_app/src/pages/tween_animation_builder_animation3.dart';
import 'package:flutter/material.dart';
import 'package:animation_app/src/pages/animation_transform_one.dart';
import 'package:animation_app/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations!!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false ,
      initialRoute: 'home',
      routes: {
        'home':(BuildContext _) => HomePage(),
        'animationTr1':(BuildContext _) => AnimationTrPageOne(),
        'animationTr2':(BuildContext _) => AnimationTrPageTwo(),
        'shakeTrAnim1':(BuildContext _) => MainShakeTransitions(),
        'shinyBtn':(BuildContext _) => MainShinyButton(),
        'tweenAnimationBld1':(BuildContext _) => TweenAnimationBuilderAnimationOne(),
        'tweenAnimationBld2':(BuildContext _) => TweenAnimationBuilderAnimationTwo(),
        'tweenAnimationBld3':(BuildContext _) => TweenAnimationBuilderAnimationThree(),
      },
    );
  }
}