import 'package:flutter/material.dart';
import 'package:gallery/components/gallery_image.dart';
import 'package:gallery/models/image_card.dart';
import 'package:gallery/provider/gallery_data.dart';
import 'package:gallery/screens/image_screen.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    List<ImageCard> galleryList = context.watch<GalleryData>().galleryList;
    return Scaffold(
      body: SafeArea(
        child: galleryList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(6),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: context.watch<GalleryData>().galleryList.length,
                itemBuilder: (context, index) {
                  galleryList[index];
                  return GalleryImage(
                    information: galleryList[index],
                    onTab: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImageScreen(
                              autor: galleryList[index].autor,
                              image: galleryList[index].imageBig),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
