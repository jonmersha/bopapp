
import 'package:bop/features/presentation/page/home/main_branch_operation_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/helper/dependencies.dart' as dep;
import 'features/controllers/BranchServiceController.dart';
import 'features/controllers/DocumentController.dart';
import 'features/route/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<DocumentController>().getPopularProductList();
    Get.find<BranchServiceController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: const MainOperationPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
