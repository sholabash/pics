import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  // ignore: use_key_in_widget_constructors
  ImageList(this.images);

  Widget build(context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return Image.network(images[index].url);
        });
  }
}
