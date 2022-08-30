

import 'package:bop/features/controllers/DocumentController.dart';

import 'package:bop/features/model/document_model.dart';
import 'package:bop/features/presentation/page/documents/document_section.dart';

import 'package:bop/features/presentation/page/service/detail_service_list.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/app_icon.dart';
import 'package:bop/features/presentation/widget/expandable_text.dart';
import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:bop/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/main_branch_operation_page.dart';

class DocumentSectionListContainer extends StatelessWidget {
  final Document documentModel;

  final DocumentController documentSectionController;
  DocumentSectionListContainer({Key? key, required this.documentModel, required this.documentSectionController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=>MainOperationPage(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 800));
                      },
                      child: AppIcon(iconData: Icons.clear,backGroundColor: AppColors.mainColor,)
                  ),
                  AppIcon(iconData: Icons.shopping_cart_outlined,),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child:Container(
                  width: double.maxFinite,
                  height: 50,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)
                      ),
                      color: Colors.white
                  ),

                  child:  BigText(text: documentModel.documentName !,size: Dimensions.fontSize26, ),
                )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height200,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.IMAGE_URL+documentModel.documentImagePath!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,

                )
            ),
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child:  ExpandableTextWidget(
                        text:documentModel.documentDescription!)
                ),
                // Text("${ serviceModel.serviceDescription!}: \n Related Service Displayed here"),
                 SectionList(docId: documentModel.documentID!)
              ],
            ),

          )
        ],

      ),
      // bottomNavigationBar:
      //NewBottomBarr(),
    );
  }
}

