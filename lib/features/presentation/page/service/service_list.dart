import 'package:bop/features/controllers/BranchServiceController.dart';
import 'package:bop/features/model/bank_service_model.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/app_icon.dart';
import 'package:bop/features/presentation/widget/expandable_text.dart';
import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:bop/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/main_branch_operation_page.dart';


class BranchService extends StatelessWidget {
  final Service serviceModel;
  final BranchServiceController recommendedProductController;
  BranchService({Key? key, required this.serviceModel, required this.recommendedProductController}) : super(key: key);

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
                      //Get.to(()=>const MainFoodPage());
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

                child:  BigText(text: serviceModel.name!,size: Dimensions.fontSize26, ),
              )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.IMAGE_URL+serviceModel.image!,
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
              text: serviceModel.description!)
      ),
    ],
  ),

)
        ],

      ),
          bottomNavigationBar:

          NewBottomBarr(),
    );
  }
}

class NewBottomBarr extends StatelessWidget {
  const NewBottomBarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        Container(

          padding: EdgeInsets.only(
            left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconSize:Dimensions.iconSize24,
                iconData: Icons.remove,
                backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,),
              BigText(text: "\$ 12.88  X 0", size: 20,color: Colors.black54,),
              AppIcon(
                iconSize:Dimensions.iconSize24,
                iconData: Icons.add,
                backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,)

            ],
          ),
        ),
        Container(
          height: Dimensions.height100,
          padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
             left: Dimensions.height20,
              right: Dimensions.height20,

          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2)
            ),
            color: Color(0xFFCACACEFF)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white
                ),
                child: Icon(Icons.favorite,color: AppColors.mainColor,size: 30,),
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                    color: AppColors.mainColor
                ),
                child: BigText(text: "\$ 28 | Add to cart",color: Colors.white,),
              ),
            ],
          ),
        )

      ]

    );
  }
}
