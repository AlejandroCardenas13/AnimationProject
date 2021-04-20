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

  @override
  void initState() {
    _loadData();
    super.initState();
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
            itemBuilder: (context, index) {
              print(index);
              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.fitWidth,
                  ));
            },
            itemCount: _images.length,
          ),
        )));
  }
}
