part of 'cats_bloc.dart';

sealed class CatsEvent extends Equatable {
  const CatsEvent();
}

final class OnGetAllCatsEvent extends CatsEvent {
  @override
  List<Object?> get props => [];
}
