import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AnimationTrPageTwo extends StatefulWidget {
  _AnimationTransformState createState() => _AnimationTransformState();
}

class _AnimationTransformState extends State<AnimationTrPageTwo> {
  List<String> _images = [];

  Future<void> _loadData() async {
    final response = await http
        .get('http://www.json-generator.com/api/json/get/bVwAqNZBaq?indent=2');
    setState(() {
      _images = (jsonDecode(response.body) as List)
          .map((e) => e['image'].toString())
          .toList();
    });
  }

  final _pageController = PageController();
  double _currentPage = 0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  @override
  void initState() {
    _loadData();
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(() {});
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation using Transform 2 - PageViewBuilder'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              final percent = (_currentPage - index);
              final value = percent.clamp(0.0, 1.0);
              print(value);
              return Opacity(
                opacity: 1 - value,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..rotateX(pi * value),
                      child: Image.network(
                        _images[index],
                        fit: BoxFit.fitWidth,
                      ),
                    )),
              );
            },
            itemCount: _images.length,
          ),
        )));
  }
}
