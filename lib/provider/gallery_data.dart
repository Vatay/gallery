import 'package:flutter/foundation.dart';
import 'package:gallery/models/image_card.dart';
import 'package:gallery/services/network_helper.dart';

class GalleryData extends ChangeNotifier {
  List<ImageCard> galleryList = [];

  Future<void> getData() async {
    dynamic data = await NetworkHelper().getData();
    List<dynamic> imagesList = data as List;
    for (int i = 0; i < imagesList.length; i++) {
      galleryList.add(
        ImageCard(
          title: imagesList[i]['description'] ?? 'Без назви(',
          autor: imagesList[i]['user']['name'] ?? '',
          imageMini: imagesList[i]['urls']['thumb'] ?? '',
          imageBig: imagesList[i]['urls']['full'] ?? '',
        ),
      );
    }
    notifyListeners();
  }
}
