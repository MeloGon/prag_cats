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
        child: Image.network(
          cat?.image?.url ?? '',
        ),
      ),
    );
  }
}
