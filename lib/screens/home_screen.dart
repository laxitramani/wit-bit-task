import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wit_by_bit/bloc/home/home_bloc.dart';
import 'package:wit_by_bit/models/item_model.dart';
import 'package:wit_by_bit/utils/assets.dart';
import 'package:wit_by_bit/utils/colors.dart';
import 'package:wit_by_bit/utils/common_codes.dart';
import 'package:wit_by_bit/utils/routes.dart';
import 'package:wit_by_bit/utils/size_config.dart';
import 'package:wit_by_bit/utils/strings.dart';
import 'package:wit_by_bit/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;

  List<ItemModel> itemList = [];
  int totalAmount = 0;
  int totalItem = 0;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    context.read<HomeBloc>().add(FetchInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is ChangeCartState) {
          totalAmount = state.amount;
          totalItem = state.totalItem;
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180.setHeight(),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.poster),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(16.setHeight()),
                child: SafeArea(
                  child: Row(
                    children: [
                      materialButton(
                        color: AppColors.white,
                        icon: AppAssets.arrowLeft,
                      ),
                      const Spacer(),
                      materialButton(
                          color: AppColors.white,
                          icon: AppAssets.search,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RouteName.searchScreen)),
                      sizeBoxWidth(16),
                      materialButton(
                        color: AppColors.white,
                        icon: AppAssets.share,
                      ),
                    ],
                  ),
                ),
              ),
              sizeBoxHeight(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    label(
                      AppString.amerikaFoods,
                      style: AppTextStyle.heavyTextStyle(
                        fontSize: 20,
                      ),
                    ),
                    materialButton(
                      color: AppColors.white,
                      borderColor: AppColors.colorDDDDDD,
                      icon: AppAssets.heart,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
                child: label(
                  AppString.amerikaFoodsContent,
                  style: AppTextStyle.smallTextStyle(),
                ),
              ),
              sizeBoxHeight(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      assetImage(
                        AppAssets.star,
                        height: 16.setHeight(),
                        width: 16.setHeight(),
                      ),
                      sizeBoxWidth(8),
                      label(
                        AppString.rate,
                        style: AppTextStyle.heavyTextStyle(fontSize: 12),
                      ),
                      const VerticalDivider(width: 32),
                      assetImage(
                        AppAssets.chat,
                        height: 16.setHeight(),
                        width: 16.setHeight(),
                      ),
                      sizeBoxWidth(8),
                      label(
                        AppString.reviews,
                        style: AppTextStyle.heavyTextStyle(fontSize: 12),
                      ),
                      const VerticalDivider(width: 32),
                      assetImage(
                        AppAssets.accessTime,
                        height: 16.setHeight(),
                        width: 16.setHeight(),
                      ),
                      sizeBoxWidth(8),
                      label(
                        AppString.mins,
                        style: AppTextStyle.heavyTextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.setHeight()),
                child: const Divider(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.setHeight()),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  overlayColor:
                      const MaterialStatePropertyAll(AppColors.transparent),
                  labelPadding: EdgeInsets.only(right: 32.setWidth()),
                  unselectedLabelStyle: AppTextStyle.normalTextStyle(),
                  labelStyle:
                      AppTextStyle.heavyTextStyle(color: AppColors.color11B546),
                  indicatorColor: AppColors.color11B546,
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Tab(text: AppString.recommended),
                    Tab(text: AppString.combos),
                    Tab(text: AppString.regularBurgers),
                    Tab(text: AppString.specialBurgers),
                    Tab(text: AppString.muttonBurgers),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.setHeight()),
                      itemCount: itemList.length,
                      separatorBuilder: (context, index) => const Divider(),
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
                    Center(child: label(AppString.combos)),
                    Center(child: label(AppString.regularBurgers)),
                    Center(child: label(AppString.specialBurgers)),
                    Center(child: label(AppString.muttonBurgers)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
