import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/cat_details/presentation/widgets/cat_details_widget.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/global/widgets/base_screen.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat? cat;
  const CatDetailsScreen({super.key, this.cat});

  @override
  Widget build(BuildContext context) {
    final routerCubit = context.watch<RouterCubit>();
    return BaseScreen(
      androidBody: Scaffold(
        appBar: AppBar(
          title: Text(cat?.name ?? ''),
          centerTitle: true,
          leading: IconButton(
              onPressed: routerCubit.goBack,
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                CatImageSectionWidget(
                  cat: cat,
                ),
                CatDetailsSectionWidget(
                  cat: cat,
                )
              ],
            ),
          ),
        ),
      ),
      iosBody: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            cat?.name ?? '',
            style: context.headlineMedium,
          ),
          leading: IconButton(
              onPressed: routerCubit.goBack,
              icon: const Icon(CupertinoIcons.back)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                CatImageSectionWidget(
                  cat: cat,
                ),
                CatDetailsSectionWidget(
                  cat: cat,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
