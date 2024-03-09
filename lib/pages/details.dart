import 'package:flutter/cupertino.dart';

class ImageData {
  final String imagePath;
  final double width;
  final double height;
  final EdgeInsets padding;

  ImageData({
    required this.imagePath,
    required this.width,
    required this.height,
    required this.padding,
  });
}
