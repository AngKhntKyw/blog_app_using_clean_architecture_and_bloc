import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    cacheKey: imageUrl,
    progressIndicatorBuilder: (context, url, progress) {
      return const Center(
        child: Loader(),
      );
    },
    errorWidget: (context, url, error) => const Center(
      child: Icon(Icons.error),
    ),
    alignment: Alignment.center,
    fadeInCurve: Curves.linear,
    fadeOutCurve: Curves.linear,
  );
}
