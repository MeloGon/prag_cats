import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cats/features/home/presentation/bloc/cats_bloc.dart';
import 'package:pragma_cats/global/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BlocBuilder<CatsBloc, CatsState>(
        builder: (context, state) {
          switch (state) {
            case CatsLoadingState():
            case CatsInitialState():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case CatsLoadedState():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: state.catsList
                          .map(
                            (p) => Text(p.name ?? ''),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );

            case CatsFailureState():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        'Ah ocurrido un error, que te parece si lo intentamos de nuevo?'),
                    TextButton(
                        onPressed: () => BlocProvider.of<CatsBloc>(context)
                            .add(OnGetAllCatsEvent()),
                        child: const Text('Volver a hacer la peticion'))
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
