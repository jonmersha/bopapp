
import 'package:bop/features/controllers/document_section_controller.dart';
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
  runApp(BranchOperations());
}

class BranchOperations extends StatelessWidget {
  const BranchOperations({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<DocumentController>().getDocumentList();
    Get.find<BranchServiceController>().getServiceList();


    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: MainOperationPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
