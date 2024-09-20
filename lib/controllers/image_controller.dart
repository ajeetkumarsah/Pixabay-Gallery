import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/image_model.dart';
import '../repositories/image_repository.dart';
import '../services/api_service.dart';

/// A controller that manages the state of image data using GetX.
class ImageController extends GetxController {
  /// The repository used to fetch images.
  late final ImageRepository _imageRepository;

  /// A reactive list of images.
  final RxList<ImageModel> images = <ImageModel>[].obs;

  /// Indicates if data is currently being loaded.
  final RxBool isLoading = false.obs;

  /// The current search query.
  final RxString query = 'yellow flowers'.obs;

  /// The current page number for pagination.
  final RxInt page = 1.obs;

  /// The number of images per page.
  final int perPage = 20;

  @override
  void onInit() {
    super.onInit();
    // Initialize the repository with ApiService.
    _imageRepository = ImageRepository(ApiService());
    // Fetch initial images.
    fetchImages();
  }

  /// Fetches images based on the current [query] and [page].
  Future<void> fetchImages({bool isRefresh = false}) async {
    debugPrint('==>Fetching data');
    try {
      isLoading(true);
      if (isRefresh) {
        page.value = 1;
      }
      final fetchedImages = await _imageRepository.getImages(
        query: query.value,
        page: page.value,
        perPage: perPage,
      );
      if (isRefresh) {
        images.assignAll(fetchedImages);
      } else {
        images.addAll(fetchedImages);
      }
      page.value += 1;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  /// Updates the search [query] and fetches new images.
  void updateQuery(String newQuery) {
    if (newQuery.trim().isEmpty) return;
    query.value = newQuery.trim();
    fetchImages(isRefresh: true);
  }

  /// Loads more images for pagination.
  void loadMore() {
    fetchImages();
  }
}
