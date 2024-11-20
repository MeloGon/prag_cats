import 'package:flutter/material.dart';
import 'package:pragma_cats/core/config.dart';

class CatInfoItemWidget extends StatelessWidget {
  final String? title;
  final String? content;
  const CatInfoItemWidget({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          20.w,
          Text(
            content ?? '',
          ),
        ],
      ),
    );
  }
}
