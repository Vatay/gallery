import 'package:flutter/material.dart';
import 'package:gallery/models/image_card.dart';

class GalleryImage extends StatelessWidget {
  final ImageCard information;
  final VoidCallback onTab;

  const GalleryImage({
    Key? key,
    required this.information,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.0),
      onTap: onTab,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  topRight: Radius.circular(6.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${information.imageMini}'),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            '${information.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2),
          Text(
            '${information.autor}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}
