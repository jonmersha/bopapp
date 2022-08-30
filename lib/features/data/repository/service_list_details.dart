import 'package:bop/features/data/api/api_client.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:get/get.dart';

class ServiceListDetailRepository extends GetxService{
  final ApIClient apIClient;
  ServiceListDetailRepository({required this.apIClient});
  Future<Response> getDocumentSectionList() async{
    return await apIClient.getData(AppConstants.DOCUMENTSCTION);
  }
  Future<Response> getDocumentSectionListByID(int id) async{
    return await apIClient.getData('${AppConstants.DOCUMENTSCTION}/?id=$id');
  }
}