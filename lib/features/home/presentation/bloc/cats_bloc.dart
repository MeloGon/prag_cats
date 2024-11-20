import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/domain/usecases/get_all_cats_usecase.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc() : super(CatsInitialState()) {
    on<OnGetAllCatsEvent>(_getCatsHandler);
  }

  void getCats() {
    add(OnGetAllCatsEvent());
  }

  void _getCatsHandler(OnGetAllCatsEvent event, Emitter<CatsState> emit) async {
    emit(CatsLoadingState());
    final cats = await getIt<GetAllCatsUsecase>().call(NoParams());
    cats.fold((failure) => emit(CatsFailureState(failure)),
        (catsList) => emit(CatsLoadedState(catsList)));
  }
}
