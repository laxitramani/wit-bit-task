import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wit_by_bit/bloc/home/home_bloc.dart';
import 'package:wit_by_bit/models/item_model.dart';
import 'package:wit_by_bit/utils/assets.dart';
import 'package:wit_by_bit/utils/colors.dart';
import 'package:wit_by_bit/utils/common_codes.dart';
import 'package:wit_by_bit/utils/size_config.dart';
import 'package:wit_by_bit/utils/strings.dart';
import 'package:wit_by_bit/utils/text_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<ItemModel> itemList = [];
  int totalAmount = 0;
  int totalItem = 0;

  List<String> recommendations = [
    "Burgers",
    "Chicken",
    "Fries",
    "Beverages",
    "Sides",
    "Desserts",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is ChangeCartState) {
          totalAmount = state.amount;
          totalItem = state.totalItem;
        } else if (state is SearchState) {
          itemList = state.itemList;
        }
        return Scaffold(
          bottomNavigationBar: totalItem != 0
              ? Container(
                  height: 68.setHeight(),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 1),
                    ],
                  ),
                  child: Row(
                    children: [
                      label(
                        "$totalItem ${AppString.item}",
                        style: AppTextStyle.heavyTextStyle(),
                      ),
                      SizedBox(
                        height: 20.setHeight(),
                        child: const VerticalDivider(width: 16),
                      ),
                      label(
                        "${AppString.currency} $totalAmount",
                        style: AppTextStyle.heavyTextStyle(),
                      ),
                      const Spacer(),
                      materialButton(
                        height: 44.setHeight(),
                        width: 93.setWidth(),
                        color: AppColors.color11B546,
                        child: label(
                          AppString.viewCart,
                          style: AppTextStyle.heavyTextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      materialButton(
                        onPressed: () => Navigator.pop(context),
                        color: AppColors.white,
                        icon: AppAssets.arrowLeft,
                      ),
                      sizeBoxWidth(4),
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          style: AppTextStyle.smallTextStyle(
                            color: AppColors.color333333,
                          ),
                          cursorHeight: 18.setHeight(),
                          onChanged: (value) {
                            context.read<HomeBloc>().add(SearchEvent(value));
                          },
                          decoration: InputDecoration(
                            fillColor: AppColors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.colorDDDDDD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.colorDDDDDD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.colorDDDDDD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            isDense: true,
                            hintText: AppString.search,
                            hintStyle: AppTextStyle.smallTextStyle(),
                            contentPadding: EdgeInsets.all(10.setHeight()),
                            prefixIcon: SizedBox(
                              height: 20.setHeight(),
                              width: 20.setWidth(),
                              child: Center(
                                child: assetImage(
                                  AppAssets.search,
                                  height: 16.setHeight(),
                                  width: 16.setHeight(),
                                ),
                              ),
                            ),
                            suffixIcon: SizedBox(
                              height: 20.setHeight(),
                              width: 20.setWidth(),
                              child: Center(
                                child: assetImage(
                                  AppAssets.microPhone,
                                  height: 20.setHeight(),
                                  width: 20.setHeight(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizeBoxHeight(16),
                  label(
                    itemList.isEmpty
                        ? AppString.searchRecommendations
                        : "${itemList.length} ${AppString.searchResults}",
                    style: AppTextStyle.smallTextStyle(),
                  ),
                  sizeBoxHeight(24),
                  itemList.isEmpty
                      ? Wrap(
                          spacing: 8.setWidth(),
                          runSpacing: 8.setHeight(),
                          children: List.generate(
                            recommendations.length,
                            (index) => InkWell(
                              onTap: () {
                                searchController.text = recommendations[index];
                                context
                                    .read<HomeBloc>()
                                    .add(SearchEvent(recommendations[index]));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.setWidth(),
                                  vertical: 4.setHeight(),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.color11B546op10,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: label(
                                  recommendations[index],
                                  style: AppTextStyle.smallTextStyle(
                                    color: AppColors.color11B546,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: itemList.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) => itemView(
                              context,
                              id: itemList[index].id!,
                              img: itemList[index].image!,
                              title: itemList[index].title!,
                              description: itemList[index].description!,
                              count: itemList[index].count!,
                              amount: itemList[index].amount!,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
