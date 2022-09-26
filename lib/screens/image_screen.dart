import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String image, autor;
  ImageScreen({required this.autor, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Фото автора $autor'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          fadeInDuration: Duration(seconds: 1),
          placeholder: 'assets/images/spinner.gif',
          image: image,
        ),
      ),
    );
  }
}
