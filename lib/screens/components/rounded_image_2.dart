import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RoundedImage2 extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const RoundedImage2({
    Key? key,
    required this.imageUrl,
    this.width = 250.0,
    this.height = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
