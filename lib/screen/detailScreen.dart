import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photoModel.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Center(
        child: Hero(
          tag:
              'image_${photo.id}', 
          child: Image.network(photo.imageUrl),
        ),
      ),
    );
  }
}
