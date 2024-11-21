import 'package:get_it/get_it.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/data/datasources/home_data_source.dart';
import 'package:pragma_cats/features/home/data/repositories/home_repository_impl.dart';
import 'package:pragma_cats/features/home/domain/repositories/home_repository.dart';
import 'package:pragma_cats/features/home/domain/usecases/get_all_cats_usecase.dart';
import 'package:pragma_cats/features/home/domain/usecases/search_cat_usecase.dart';
import 'package:pragma_cats/features/home/presentation/bloc/cats_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(RouterCubit());
  getIt.registerSingleton(AppNetwork());

  getIt
      .registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(getIt()));
  getIt
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetAllCatsUsecase>(
      () => GetAllCatsUsecase(getIt()));
  getIt.registerLazySingleton<SearchCatUsecase>(() => SearchCatUsecase());
  getIt.registerSingleton(CatsBloc()..getCats());
}
