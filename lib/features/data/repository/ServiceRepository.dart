
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ServiceRepository extends GetxService{
  final ApIClient apIClient;

  ServiceRepository({required this.apIClient});

  Future<Response> getRecommendedProductList() async{
    return await apIClient.getData(AppConstants.BANKSERVICE);

  }
}