part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeCartState extends HomeState {
  List<ItemModel> itemList;
  int totalItem;
  int amount;

  ChangeCartState(this.amount, this.totalItem, this.itemList);
}

final class SearchState extends HomeState {
  List<ItemModel> itemList;

  SearchState(this.itemList);
}
