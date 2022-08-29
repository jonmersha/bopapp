
import 'package:bop/features/presentation/page/service/component/BankServiceList.dart';
import 'package:bop/features/presentation/page/home/components/DocumentSlider.dart';
import 'package:bop/features/presentation/widget/BigText.dart';
import 'package:bop/features/presentation/widget/SmalText.dart';
import 'package:bop/features/utils/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankServiceBody extends StatefulWidget {
  const BankServiceBody({Key? key}) : super(key: key);
  @override
  State<BankServiceBody> createState() => _BankServiceBodyState();
}

class _BankServiceBodyState extends State<BankServiceBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DocumentSlider(),
        //Dots Section

        //Popular Sectios
        SizedBox(
          height: Dimensions.margin30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.margin30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Service",
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "Service")
            ],
          ),
        ),
        //List of foods and immages
        const ServiceList()
      ],
    );
  }

}

//1.23.58 Stoped Here
//1.56.48 Stoped here
