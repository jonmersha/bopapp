
import 'package:bop/features/model/service_detail_model.dart';
import 'package:bop/features/model/service_model.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/SmalText.dart';

import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/dimensions.dart';

import 'package:flutter/material.dart';

class DetailserviceCard extends StatelessWidget {
  final ServiceDetail serviceDetail;
  const DetailserviceCard({
    Key? key, required this.serviceDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: serviceDetail.serviceName!,
          size: Dimensions.fontSize20,
          color: AppColors.mainColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: serviceDetail.seviceDescription!,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
        )
      ],
    );
  }
}
