// lib/repositories/image_repository.dart

import '../models/image_model.dart';
import '../services/api_service.dart';

/// A repository that abstracts data fetching from the [ApiService].
class ImageRepository {
  /// The API service used to fetch images.
  final ApiService _apiService;

  /// Creates an instance of [ImageRepository].
  ImageRepository(this._apiService);

  /// Fetches images based on the given [query].
  ///
  /// Supports pagination with [page] and [perPage].
  Future<List<ImageModel>> getImages({
    required String query,
    int page = 1,
    int perPage = 20,
  }) async {
    return await _apiService.fetchImages(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
