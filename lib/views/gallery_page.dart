import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery_getx/views/widgets/image_card_widget.dart';
import 'package:pixabay_gallery_getx/views/widgets/search_box_widget.dart';
import '../controllers/image_controller.dart';
import '../models/image_model.dart';

/// A page that displays a gallery of images fetched from Pixabay.
class GalleryPage extends StatelessWidget {
  /// Creates an instance of [GalleryPage].
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the ImageController using GetX dependency injection.
    final ImageController controller = Get.put(ImageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Gallery'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.fetchImages(isRefresh: true),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBar(controller: controller),
          ),
          // Image Grid
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value && controller.images.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.images.isEmpty) {
                  return const Center(child: Text('No images found.'));
                } else {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!controller.isLoading.value &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        controller.loadMore();
                      }
                      return false;
                    },
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double screenWidth = constraints.maxWidth;
                        final int crossAxisCount = (screenWidth / 200).floor();

                        return GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                crossAxisCount > 0 ? crossAxisCount : 1,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.90,
                          ),
                          itemCount: controller.images.length +
                              (controller.isLoading.value ? 1 : 0),
                          itemBuilder: (BuildContext context, int index) {
                            if (index < controller.images.length) {
                              final ImageModel image = controller.images[index];
                              return ImageCard(image: image);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
