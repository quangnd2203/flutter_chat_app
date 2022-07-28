import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../utils/app_utils.dart';

enum ImageNetworkShape { none, circle }

class WidgetImageNetwork extends StatelessWidget {

  const WidgetImageNetwork(
      {Key? key, this.url,
      this.fit,
      this.height,
      this.width,
      this.assetError,
      this.shape = ImageNetworkShape.none}) : super(key: key);
  static String placeholder({int width = 720, int height = 720, String text = 'No Image'}) =>
      'https://via.placeholder.com/${width}x$height.png?text=$text';

  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageNetworkShape shape;
  final String? assetError;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppUtils.pathMediaToUrl(url),
      width: width,
      height: height,
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(),
      ),
      imageBuilder: (_, ImageProvider image) {
        switch (shape) {
          case ImageNetworkShape.circle:
            return CircleAvatar(radius: (width ?? height ?? 0) / 2, backgroundImage: image);
          case ImageNetworkShape.none:
            return Image(
              image: image,
              fit: fit ?? BoxFit.cover,
            );
        }
      },
      errorWidget: (_, __, ___){
        return Image.asset(
          assetError ?? AppImages.png('image_empty'),
          fit: BoxFit.cover,
          width: (width ?? height ?? 0) * 2 / 3,
        );
      },
    );
  }
}
