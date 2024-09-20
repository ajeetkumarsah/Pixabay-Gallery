import 'package:flutter/material.dart';
import 'package:pixabay_gallery_getx/controllers/image_controller.dart';

/// A widget that displays a search bar for querying images.
class CustomSearchBar extends StatelessWidget {
  /// The controller managing image data.
  final ImageController controller;

  /// Creates an instance of [SearchBar].
  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController =
        TextEditingController(text: controller.query.value);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'Search Images',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                controller.updateQuery(value.trim());
              }
            },
          ),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            final query = textController.text.trim();
            if (query.isNotEmpty) {
              controller.updateQuery(query);
            }
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
