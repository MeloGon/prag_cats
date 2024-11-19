import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_cats/features/home/presentation/screens/home_screen.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  //GoRoute(path: '/splashScreen',builder: (context,state) => ),
]);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_publicRouter);
}
