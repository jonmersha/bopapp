
import 'package:bop/features/model/document_model.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/SmalText.dart';


import 'package:flutter/material.dart';

import '../../../../utils/dimensions.dart';

class SmallCard extends StatelessWidget {
 final Document documentList;
  const SmallCard({Key? key,required this.documentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(
            left: Dimensions.width10,
            right: Dimensions.width10),
        margin: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.margin30
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Color(0xff32373f),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff3d7ddc),
                  blurRadius: 5.0,
                  offset: Offset(-5, 5)),
              // BoxShadow(
              //     color: Color(0xff3d7ddc), offset: Offset(5, 0))
            ]
        ),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.height10,
              right: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: documentList.documentName!,
                size: Dimensions.fontSize20,
                color: Colors.white,
              ),

              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(text: documentList.documentDescription!,color: Colors.white ,size: 12,)
            ],
          ),
        ),
      ),
    )
    ;
  }
}
