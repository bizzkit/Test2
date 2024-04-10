import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photoModel.dart';

class PhotoListItem extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  const PhotoListItem({
    Key? key,
    required this.photo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'thumbnail_${photo.id}', 
        child: Image.network(photo.thumbnailUrl),
      ),
      title: Text(photo.title),
      onTap: onTap,
    );
  }
}