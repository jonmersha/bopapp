import 'package:bop/features/controllers/DocumentController.dart';
import 'package:bop/features/model/document_model.dart';

import 'package:bop/features/presentation/page/documents/DocumentDetail.dart';
import 'package:bop/features/presentation/page/home/components/small_card.dart';
import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:bop/features/utils/dimensions.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentSlider extends StatefulWidget {
  const DocumentSlider({Key? key}) : super(key: key);
  @override
  State<DocumentSlider> createState() => _DocumentSliderState();
}

class _DocumentSliderState extends State<DocumentSlider> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactors = 0.8;
  final double _height = Dimensions.pageViewContainer;


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return        Column(
      children: [
        GetBuilder<DocumentController>(builder: (popularProduct){
          return popularProduct.isLoaded?Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProduct.documentList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProduct.documentList[position],popularProduct);
                }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        GetBuilder<DocumentController>(builder: (popularProduct){
          return DotsIndicator(
            dotsCount: popularProduct.documentList.isEmpty?1:popularProduct.documentList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, Document productModel,DocumentController popularProductController) {
    //Scalling while sliding
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactors + (_currPageValue - index + 1) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactors) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.to(()=>DocumentDetail(documentModel: productModel,documentController: popularProductController),
                  transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 800));
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                // alignment: Alignment.topCenter,
                height: Dimensions.pageViewContainer,
                padding: EdgeInsets.only(
                    left: Dimensions.padding10,
                    right: Dimensions.padding10,
                    top: Dimensions.padding10 ),
                margin: EdgeInsets.only(
                    left: Dimensions.padding10,
                    right: Dimensions.padding10,
                    top: Dimensions.padding10 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: index.isEven ? Color(0XFF69c5df) : Color(0XFF69c500),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.IMAGE_URL+productModel.image!))),
              ),
            ),
          ),
         // SmallCard(productmodel: popularProductList)
          SmallCard(ducumentList: popularProductController.documentList[index])
        ],
      ),
    );
  }

}
