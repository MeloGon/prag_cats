import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_cats/features/cat_details/presentation/screens/cat_details_screen.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/presentation/screens/home_screen.dart';

final _publicRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/catDetails',
      builder: (context, state) {
        final cat = state.extra as Cat;
        return CatDetailsScreen(cat: cat);
      },
    ),
    //GoRoute(path: '/splashScreen',builder: (context,state) => ),
  ],
);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);

  void goBack() {
    state.pop();
  }

  void goCatDetails(Cat cat) {
    state.push('/catDetails', extra: cat);
  }
}
