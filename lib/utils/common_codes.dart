import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wit_by_bit/bloc/home/home_bloc.dart';
import 'package:wit_by_bit/utils/assets.dart';
import 'package:wit_by_bit/utils/colors.dart';
import 'package:wit_by_bit/utils/size_config.dart';
import 'package:wit_by_bit/utils/strings.dart';
import 'package:wit_by_bit/utils/text_style.dart';

Widget label(String label, {TextStyle? style}) {
  return Text(label, style: style);
}

Widget assetImage(
  String img, {
  double? height,
  double? width,
  Color? imgColor,
  BoxFit? fit,
}) {
  return Image.asset(
    img,
    fit: fit,
    color: imgColor,
    height: height,
    width: width,
  );
}

Widget materialButton({
  Color? color,
  String? icon,
  Widget? child,
  Color? borderColor,
  Color? imgColor,
  void Function()? onPressed,
  double size = 32,
  double? height,
  double? width,
  double imgSize = 16,
}) {
  return MaterialButton(
    onPressed: onPressed ?? () {},
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: EdgeInsets.zero,
    minWidth: width ?? size.setHeight(),
    height: height ?? size.setHeight(),
    color: color ?? AppColors.black,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
      side: borderColor != null
          ? BorderSide(color: borderColor)
          : BorderSide.none,
    ),
    child: icon != null
        ? assetImage(
            icon,
            imgColor: imgColor,
            height: 16.setHeight(),
            width: 16.setHeight(),
          )
        : child,
  );
}

Widget itemView(
  BuildContext context, {
  required int id,
  required String img,
  required String title,
  required String description,
  required int amount,
  required int count,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 24.setHeight()),
    child: SizedBox(
      height: 120.setHeight(),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120.setHeight(),
            width: 120.setHeight(),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: assetImage(
              img,
            ),
          ),
          sizeBoxWidth(16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                label(
                  title,
                  style: AppTextStyle.heavyTextStyle(),
                ),
                sizeBoxHeight(8),
                label(
                  description,
                  style: AppTextStyle.smallTextStyle(fontSize: 12),
                ),
                const Spacer(),
                Row(
                  children: [
                    label(
                      "${AppString.currency} $amount",
                      style: AppTextStyle.heavyTextStyle(),
                    ),
                    const Spacer(),
                    materialButton(
                      onPressed: count != 0
                          ? () =>
                              context.read<HomeBloc>().add(RemoveCartEvent(id))
                          : null,
                      icon: AppAssets.minus,
                      imgColor: count != 0
                          ? AppColors.color11B546
                          : AppColors.colorDDDDDD,
                      color: count != 0
                          ? AppColors.color11B546op10
                          : AppColors.colorDDDDDDop10,
                      borderColor: count != 0
                          ? AppColors.color11B546
                          : AppColors.colorDDDDDD,
                    ),
                    sizeBoxWidth(16),
                    label(
                      count.toString(),
                      style: AppTextStyle.heavyTextStyle(),
                    ),
                    sizeBoxWidth(16),
                    materialButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(AddCartEvent(id)),
                      icon: AppAssets.plus,
                      color: AppColors.color11B546op10,
                      borderColor: AppColors.color11B546,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
