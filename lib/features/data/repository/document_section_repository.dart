import 'package:bop/features/data/api/api_client.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:get/get.dart';

class DocumentSectionRepository extends GetxService{
  final ApIClient apIClient;
  DocumentSectionRepository({required this.apIClient});
  Future<Response> getDocumentSectionList() async{
    return await apIClient.getData(AppConstants.DOCUMENTSCTION);
  }
  Future<Response> getDocumentSectionListByID(int id) async{
    // String adress='${AppConstants.DOCUMENTSCTION}/?id=$id';
    // print("=======================================================");
    // print(adress);
    return await apIClient.getData('${AppConstants.DOCUMENTSCTION}/?id=$id');
  }
}