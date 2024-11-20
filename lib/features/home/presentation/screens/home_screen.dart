import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/core/extensions/text_theme_extension.dart';
import 'package:pragma_cats/features/home/presentation/bloc/cats_bloc.dart';
import 'package:pragma_cats/features/home/presentation/widgets/home_widgets.dart';
import 'package:pragma_cats/global/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      androidBody: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appTitle),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                10.h,
                BlocBuilder<CatsBloc, CatsState>(
                  builder: (context, state) {
                    switch (state) {
                      case CatsLoadingState():
                      case CatsInitialState():
                        return const Center(
                          child: CircularProgressIndicator(),
                        );

                      case CatsLoadedState():
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: state.catsList.map((cat) {
                              return CatCardWidget(cat: cat);
                            }).toList(),
                          ),
                        );

                      case CatsFailureState():
                        return const Center(
                          child: Text(AppStrings.anErrorHasOcurred),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      iosBody: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            AppStrings.appTitle,
            style: context.headlineMedium,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                //CupertinoTextField(),
                CupertinoSearchTextField(
                  controller: TextEditingController(),
                  placeholder: AppStrings.search,
                ),
                10.h,
                BlocBuilder<CatsBloc, CatsState>(
                  builder: (context, state) {
                    switch (state) {
                      case CatsLoadingState():
                      case CatsInitialState():
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );

                      case CatsLoadedState():
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: state.catsList.map((cat) {
                              return CatCardWidget(cat: cat);
                            }).toList(),
                          ),
                        );

                      case CatsFailureState():
                        return const Center(
                          child: Text(AppStrings.anErrorHasOcurred),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
