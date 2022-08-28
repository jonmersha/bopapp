
import 'package:bop/features/presentation/page/home/main_branch_operation_page.dart';
import 'package:get/get.dart';


class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String foodBody = "/food-body";

  static String getInitial()=>'$initial';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainOperationPage()),
    GetPage(name: initial, page: (){
      return MainOperationPage();
    }),
    //GetPage(name: recommendedFood, page: ()=>MainFoodPage()),
  ];
}