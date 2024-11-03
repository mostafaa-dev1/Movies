import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key, required this.url, this.height, required this.width});
  final String url;
  final double? height;
  final double width;

  final phoneUrl = 'https://image.tmdb.org/t/p/w500';
  final tabletUrl = 'https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return ProgressiveImage(
          placeholder: const AssetImage('assets/images/placeholder.png'),
          thumbnail: url == ''
              ? const AssetImage('assets/images/placeholder.png')
              : NetworkImage(
                  '$tabletUrl$url',
                ),
          image: url == ''
              ? const AssetImage('assets/images/placeholder.png')
              : NetworkImage(
                  '$tabletUrl$url',
                ),
          fit: BoxFit.fill,
          width: width,
          height: height ?? MediaQuery.sizeOf(context).height - 50);
    }
    return ProgressiveImage(
        placeholder: const AssetImage('assets/images/placeholder.png'),
        thumbnail: url == ''
            ? const AssetImage('assets/images/placeholder.png')
            : NetworkImage(
                '$phoneUrl$url',
              ),
        image: url == ''
            ? const AssetImage('assets/images/placeholder.png')
            : NetworkImage(
                '$phoneUrl$url',
              ),
        fit: BoxFit.fill,
        width: width,
        height: height ?? 450);
  }
}
