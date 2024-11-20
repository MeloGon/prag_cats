import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/core/config.dart';

import 'package:pragma_cats/features/home/domain/entities/cat.dart';

class CatCardWidget extends StatelessWidget {
  final Cat cat;
  const CatCardWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final appRouterCubit = context.watch<RouterCubit>();
    return InkWell(
      onTap: () {
        appRouterCubit.goCatDetails(cat);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.only(top: 15),
        child: Stack(
          children: [
            Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.4, 0.6, 1],
                  ),
                ),
                child: (cat.image?.url != null)
                    ? Hero(
                        tag: '${cat.id}',
                        child: Image.network(
                          cat.image!.url!,
                        ),
                      )
                    : const SizedBox()),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                cat.name ?? '',
                style: context.headlineSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Text(
                AppStrings.more,
                style: context.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                cat.origin ?? '',
                style: context.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                '${cat.intelligence ?? ''}',
                style: context.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
