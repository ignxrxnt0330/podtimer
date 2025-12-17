part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class IndexChanged extends HomeEvent {
  final int index;
  const IndexChanged(this.index);
}

class FetchData extends HomeEvent {
  const FetchData();
}
