import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/domain/entities/cat.dart';
import 'package:pragma_cats/features/home/domain/usecases/get_all_cats_usecase.dart';
import 'package:pragma_cats/features/home/domain/usecases/search_cat_usecase.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc() : super(CatsInitialState()) {
    on<OnGetAllCatsEvent>(_getCatsHandler);
    on<OnSearchCatEvent>(_searchCatHandler);
  }

  void getCats() {
    add(OnGetAllCatsEvent());
  }

  void searchCats(String query) {
    add(OnSearchCatEvent(query));
  }

  void _getCatsHandler(OnGetAllCatsEvent event, Emitter<CatsState> emit) async {
    emit(CatsLoadingState());
    final cats = await getIt<GetAllCatsUsecase>().call(NoParams());
    cats.fold((failure) => emit(CatsFailureState(failure)),
        (catsList) => emit(CatsLoadedState(catsList, filteredCats: catsList)));
  }

  void _searchCatHandler(OnSearchCatEvent event, Emitter<CatsState> emit) {
    if (state is CatsLoadedState) {
      final currentState = state as CatsLoadedState;
      final filteredCatsList =
          getIt<SearchCatUsecase>().call(event.query, currentState.catsList);
      emit(CatsLoadedState(currentState.catsList,
          filteredCats: filteredCatsList));
    }
  }
}
