import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pixabay_gallery_getx/utils/app_constants.dart';
import '../models/image_model.dart';

/// A service that interacts with the Pixabay API.
class ApiService {
  /// Fetches a list of images from Pixabay.
  ///
  /// [query] is the search term. Defaults to 'nature'.
  /// [page] specifies the page number for pagination.
  /// [perPage] specifies the number of results per page.
  Future<List<ImageModel>> fetchImages({
    String query = 'nature',
    int page = 1,
    int perPage = 20,
  }) async {
    final uri = Uri.parse(
      '${AppConstants.baseUrl}?key=${AppConstants.apiKey}&q=$query&image_type=photo&pretty=true&page=$page&per_page=$perPage',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> hits = data['hits'];
      Logger().i('==>Data ${data['hits']}');
      return hits.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images: ${response.reasonPhrase}');
    }
  }
}
