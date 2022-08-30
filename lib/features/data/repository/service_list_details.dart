import 'package:bop/features/data/api/api_client.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:get/get.dart';

class ServiceListDetailRepository extends GetxService{
  final ApIClient apIClient;
  ServiceListDetailRepository({required this.apIClient});
  Future<Response> getServiceDetailListByID(int id) async{
    print('${AppConstants.BANKSERVICEDETAIL}/?id=$id');
    return await apIClient.getData('${AppConstants.BANKSERVICEDETAIL}/?id=$id');
  }
}