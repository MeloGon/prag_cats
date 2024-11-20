import 'package:fpdart/src/either.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/data/datasources/home_data_source.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<Either<Failure, List<Cat>>> getCats() async {
    try {
      final cats = await homeDataSource.getCats();
      return right(cats);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
