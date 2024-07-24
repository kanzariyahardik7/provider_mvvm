import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/myimage.dart';

class MyNetworkImage extends StatefulWidget {
  final String? imageUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? fit;
  const MyNetworkImage(
      {super.key,
      required this.imageUrl,
      this.imgHeight,
      this.imgWidth,
      required this.fit});

  @override
  State<MyNetworkImage> createState() => _MyNetworkImageState();
}

class _MyNetworkImageState extends State<MyNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${widget.imageUrl}",
      imageBuilder: (context, imageProvider) => Container(
        height: widget.imgHeight,
        width: widget.imgWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: widget.fit,
          ),
        ),
      ),
      placeholder: (context, url) => MyImage(
        imagePath: "assets/images/placeholder.png",
        fit: widget.fit,
        height: widget.imgHeight,
        width: widget.imgWidth,
      ),
      errorWidget: (context, url, error) => MyImage(
        imagePath: "assets/images/placeholder.png",
        fit: widget.fit,
        height: widget.imgHeight,
        width: widget.imgWidth,
      ),
    );
  }
}
