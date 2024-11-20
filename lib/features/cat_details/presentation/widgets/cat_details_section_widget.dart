import 'package:flutter/material.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/presentation/widgets/home_widgets.dart';

class CatDetailsSectionWidget extends StatelessWidget {
  final Cat? cat;
  const CatDetailsSectionWidget({super.key, this.cat});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatInfoItemWidget(
              title: 'Description',
              content: cat?.description,
            ),
            CatInfoItemWidget(
              title: 'Temperament',
              content: cat?.temperament,
            ),
            CatInfoItemWidget(
              title: 'Origin',
              content: cat?.origin,
            ),
            CatInfoItemWidget(
              title: 'Life span',
              content: cat?.lifeSpan,
            ),
            CatInfoItemWidget(
              title: 'Intelligence',
              content: '${cat?.intelligence ?? ''}',
            ),
            CatInfoItemWidget(
              title: 'Affection Level',
              content: '${cat?.affectionLevel ?? ''}',
            ),
            CatInfoItemWidget(
              title: 'Dog Friendly',
              content: '${cat?.dogFriendly ?? ''}',
            ),
            CatInfoItemWidget(
              title: 'Energy Level',
              content: '${cat?.energyLevel ?? ''}',
            ),
          ],
        ),
      ),
    );
  }
}
