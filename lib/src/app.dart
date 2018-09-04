import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';
import 'package:pics/src/widgets/image_list.dart';

// https://jsonplaceholder.typicode.com/photos/5

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> _images = [];

  void fetchImage() async { 
    counter++;
    final response = await get('https://jsonplaceholder.typicode.com/photos/${counter}');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState((){
      _images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Images!'),
        ), 
        body: ImageList(_images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add)
        ),
      ),
    ); 
  }
}  