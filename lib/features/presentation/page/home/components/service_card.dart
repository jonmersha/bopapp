import 'dart:developer';

import 'package:bop/features/model/bank_service_model.dart';
import 'package:bop/features/model/document_model.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/SmalText.dart';
import 'package:bop/features/presentation/widget/text_with_icon.dart';
import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/dimensions.dart';

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Service product;
  const ServiceCard({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: product.name!,
          size: Dimensions.fontSize20,
          color: AppColors.mainColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: product.description!,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            TextWithIcon(
              text: "Time ",
              icon: Icons.circle,
              iconColor: Colors.yellow,
              iconSize: Dimensions.icon26,
              textSize: Dimensions.fontSize12,
              textColor: AppColors.textColor,
            ),
            TextWithIcon(
              text: "Location",
              icon: Icons.location_on,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
            TextWithIcon(
              text: "",
              icon: Icons.timelapse,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
          ],
        )
      ],
    );
  }
}
