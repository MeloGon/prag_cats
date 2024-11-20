import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/core/config/di/service_locator.dart';
import 'package:pragma_cats/core/config/router/app_router.dart';
import 'package:pragma_cats/features/home/presentation/bloc/cats_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<RouterCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<CatsBloc>(),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterCubit = context.watch<RouterCubit>().state;
    if (Platform.isIOS) {
      return CupertinoApp.router(
        routerConfig: appRouterCubit,
        title: 'Flutter Demo',
        theme: CupertinoThemeData(primaryColor: Colors.deepPurple),
      );
    } else {
      return MaterialApp.router(
        routerConfig: appRouterCubit,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      );
    }
  }
}
