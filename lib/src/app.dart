//import flutter helper libary

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';
import 'widgets/image_list.dart';

//craete a class that is a custom widget
//this class must extend the 'statelessWidget' base class

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
//must define a 'build' method that return
//the widgets that *this* widget will show

  int counter = 0;
  List<ImageModel> images = [];

  void fectImage() async {
    counter += 1;

    var response = await get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter"));

    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Lets see some images'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          // ignore: prefer_const_constructors
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              fectImage();
            });
          },
        ),
      ),
    );
  }
}
