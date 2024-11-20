import 'package:fpdart/fpdart.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Cat>>> getCats();
}
