import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CachedImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () async {
      await ImageCacheManager.instance.fetchAndCacheImage(widget.imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: ImageCacheManager.instance.imageNotifier(
          widget.imageUrl),
      builder: (context, cachedImage, _) {
        if (cachedImage != null) {
          return Image.file(
            cachedImage,
            width: widget.width,
            height: widget.height,
            cacheWidth: widget.width?.floor(),
            cacheHeight: widget.height?.floor(),
            fit: BoxFit.cover,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ImageCacheManager extends ChangeNotifier {
  static final ImageCacheManager _instance = ImageCacheManager._();

  static ImageCacheManager get instance => _instance;

  final Map<String, ValueNotifier<File?>> _cachedImages = {};

  ImageCacheManager._();

  ValueNotifier<File?> imageNotifier(String imageUrl) {
    _cachedImages.putIfAbsent(imageUrl, () => ValueNotifier(null));
    return _cachedImages[imageUrl]!;
  }

  Future<void> fetchAndCacheImage(String imageUrl) async {
    if (imageNotifier(imageUrl).value != null) return;
    final response = await http.get(Uri.parse(imageUrl));
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${imageUrl.hashCode}.jpg');
    await file.writeAsBytes(response.bodyBytes);
    imageNotifier(imageUrl).value = file;
  }
}
