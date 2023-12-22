import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wit_by_bit/models/item_model.dart';
import 'package:wit_by_bit/utils/assets.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchInitialData>(fetchInitialData);
    on<AddCartEvent>(addCartEvent);
    on<RemoveCartEvent>(removeCartEvent);
    on<SearchEvent>(searchEvent);
  }

  fetchInitialData(FetchInitialData event, emit) {
    emit(ChangeCartState(0, 0, itemData));
  }

  addCartEvent(AddCartEvent event, emit) {
    int index = itemData.indexWhere((element) => element.id == event.id);
    itemData[index].count = itemData[index].count! + 1;

    int totalItem = 0;
    int amount = 0;

    for (ItemModel ele in itemData) {
      if (ele.count != 0) {
        totalItem += ele.count!;
        amount += (ele.count! * ele.amount!);
      }
    }

    emit(ChangeCartState(amount, totalItem, itemData));
  }

  removeCartEvent(RemoveCartEvent event, emit) {
    int index = itemData.indexWhere((element) => element.id == event.id);
    itemData[index].count = itemData[index].count! - 1;

    int totalItem = 0;
    int amount = 0;

    for (ItemModel ele in itemData) {
      if (ele.count != 0) {
        totalItem += ele.count!;
        amount += (ele.count! * ele.amount!);
      }
    }

    emit(ChangeCartState(amount, totalItem, itemData));
  }

  searchEvent(SearchEvent event, emit) {
    List<ItemModel> tempList = event.searchString.isEmpty
        ? []
        : itemData
            .where((element) => element.title!
                .toLowerCase()
                .contains(event.searchString.toLowerCase()))
            .toList();

    emit(SearchState(tempList));
  }

  List<ItemModel> itemData = [
    ItemModel(
      id: 1,
      title: "Chicken Slab Burger",
      description:
          "It is a long established fact that a reader will be distracted.",
      image: AppAssets.bun1,
      amount: 259,
      count: 0,
    ),
    ItemModel(
      id: 2,
      title: "Chicken Crunch Burger",
      description:
          "It is a long established fact that a reader will be distracted.",
      image: AppAssets.bun2,
      amount: 209,
      count: 0,
    ),
    ItemModel(
      id: 3,
      title: "Donut Header Chicken",
      description:
          "It is a long established fact that a reader will be distracted.",
      image: AppAssets.bun3,
      amount: 199,
      count: 0,
    ),
    ItemModel(
      id: 4,
      title: "Mighty Chicken Patty Burgerr",
      description:
          "It is a long established fact that a reader will be distracted.",
      image: AppAssets.bun4,
      amount: 209,
      count: 0,
    ),
    ItemModel(
      id: 5,
      title: "Chicken Slab Burger",
      description:
          "It is a long established fact that a reader will be distracted.",
      image: AppAssets.bun1,
      amount: 259,
      count: 0,
    ),
  ];
}
