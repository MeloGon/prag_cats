part of 'cats_bloc.dart';

sealed class CatsState extends Equatable {}

final class CatsInitialState extends CatsState {
  @override
  List<Object> get props => [];
}

final class CatsLoadingState extends CatsState {
  @override
  List<Object?> get props => [];
}

final class CatsLoadedState extends CatsState {
  final List<Cat> catsList;
  final List<Cat>? filteredCats;
  CatsLoadedState(this.catsList, {this.filteredCats});
  @override
  List<Object?> get props => [catsList, filteredCats];
}

final class CatsFailureState extends CatsState {
  final Failure failure;
  CatsFailureState(this.failure);
  @override
  List<Object?> get props => [failure];
}
