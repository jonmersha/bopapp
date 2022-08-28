import 'package:bop/features/controllers/DocumentController.dart';
import 'package:bop/features/controllers/BranchServiceController.dart';
import 'package:bop/features/data/api/api_client.dart';
import 'package:bop/features/data/repository/DocumentRepository.dart';
import 'package:bop/features/data/repository/ServiceRepository.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApIClient(appBaseUrl: AppConstants.BASE_URL));

//repos
  Get.lazyPut(() => DocumentRepository(apIClient: Get.find()));
  Get.lazyPut(() => ServiceRepository(apIClient: Get.find()));

//Controllers
  Get.lazyPut(() => DocumentController(documentRepo: Get.find()));
  Get.lazyPut(() => BranchServiceController(serviceRepo: Get.find()));
}
