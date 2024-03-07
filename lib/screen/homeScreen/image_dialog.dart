import 'package:flutter/material.dart';
import 'package:task1/models/photos.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key, required this.photo});

  final Photos photo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Фото № ${photo.id}' ),
      actions: [
        Image.network(photo.imgSrc!),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Camera id:'),
                  Text('${photo.camera!.id}')
                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Camera name:'),
                  Text('${photo.camera!.name}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Earth date:'),
                  Text('${photo.earthDate}')
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}