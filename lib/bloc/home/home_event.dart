part of 'home_bloc.dart';

sealed class HomeEvent {}

class FetchInitialData extends HomeEvent {}

class AddCartEvent extends HomeEvent {
  int id;
  AddCartEvent(this.id);
}

class RemoveCartEvent extends HomeEvent {
  int id;
  RemoveCartEvent(this.id);
}

class SearchEvent extends HomeEvent {
  String searchString;
  SearchEvent(this.searchString);
}
