import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';

class CatImageSectionWidget extends StatelessWidget {
  final Cat? cat;
  const CatImageSectionWidget({super.key, this.cat});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${cat?.id}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: cat?.image?.url ?? '',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
