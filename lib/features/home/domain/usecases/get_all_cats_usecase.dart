import 'package:fpdart/fpdart.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/domain/repositories/home_repository.dart';

class GetAllCatsUsecase implements UseCase<List<Cat>, NoParams> {
  final HomeRepository homeRepository;
  GetAllCatsUsecase(this.homeRepository);

  @override
  Future<Either<Failure, List<Cat>>> call(NoParams params) async =>
      await homeRepository.getCats();
}
