
import 'package:bop/features/model/document_section_model.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/SmalText.dart';

import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/dimensions.dart';

import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final Section section;
  const SectionCard({
    Key? key, required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: section.sectionName!,
          size: Dimensions.fontSize20,
          color: AppColors.mainColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        SmallText(
          text: section.sectionDescription!,
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
