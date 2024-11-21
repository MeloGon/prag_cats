import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/presentation/bloc/cats_bloc.dart';
import 'package:pragma_cats/features/home/presentation/widgets/home_widgets.dart';
import 'package:pragma_cats/global/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      androidBody: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appTitle),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                children: [
                  TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<CatsBloc>().searchCats(value);
                    },
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
                          final filteredCats = state.filteredCats;
                          if (filteredCats?.isEmpty ?? false) {
                            return const Center(
                                child: Text('No results found'));
                          }
                          return Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: state.filteredCats!.map((cat) {
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
      ),
      iosBody: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            AppStrings.appTitle,
            style: context.headlineMedium,
          ),
          automaticallyImplyLeading: false,
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
                  onChanged: (value) {
                    context.read<CatsBloc>().searchCats(value);
                  },
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
                        final filteredCats = state.filteredCats;
                        if (filteredCats?.isEmpty ?? false) {
                          return const Center(child: Text('No results found'));
                        }
                        return Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: state.filteredCats!.map((cat) {
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
