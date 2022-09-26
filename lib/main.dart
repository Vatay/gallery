import 'package:flutter/material.dart';
import 'package:gallery/provider/gallery_data.dart';
import 'package:gallery/screens/gallery_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GalleryData()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gallery',
        theme: ThemeData.dark(),
        home: const GalleryScreen(),
      ),
    );
  }
}
