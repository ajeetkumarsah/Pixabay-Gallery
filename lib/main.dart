import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/gallery_page.dart';

/// The entry point of the application.
void main() {
  runApp(const PixabayGalleryApp());
}

/// The root widget of the Pixabay Gallery application.
class PixabayGalleryApp extends StatelessWidget {
  /// Creates an instance of [PixabayGalleryApp].
  const PixabayGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pixabay Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GalleryPage(),
    );
  }
}
