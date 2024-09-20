import 'package:flutter/material.dart';
import 'package:pixabay_gallery_getx/models/image_model.dart';
import 'package:pixabay_gallery_getx/utils/app_constants.dart';

/// A widget that displays an image along with its likes and views.
class ImageCard extends StatelessWidget {
  /// The image data to display.
  final ImageModel image;

  /// Creates an instance of [ImageCard].
  const ImageCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Display the image
        // ListTile(
        //   leading: image.userImageUrl != null
        //       ? ClipRRect(
        //           borderRadius: BorderRadius.circular(100),
        //           child: Image.network(
        //             image.userImageUrl ?? '',
        //             height: 50,
        //             width: 50,
        //           ),
        //         )
        //       : const CircleAvatar(child: Icon(Icons.person)),
        // ),
        const SizedBox(height: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: image.previewUrl != null && image.previewUrl!.isNotEmpty
                ? Image.network(
                    image.previewUrl ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Center(child: Icon(Icons.error));
                    },
                  )
                : Image.network(AppConstants.defaultImage),
            // child:
          ),
        ),
        const SizedBox(height: 4.0),
        // Display likes and views
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Likes
              Row(
                children: [
                  const Icon(Icons.thumb_up, size: 16.0),
                  const SizedBox(width: 4.0),
                  Text('${image.likes}'),
                ],
              ),
              // Views
              Row(
                children: [
                  const Icon(Icons.visibility, size: 16.0),
                  const SizedBox(width: 4.0),
                  Text('${image.views}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
