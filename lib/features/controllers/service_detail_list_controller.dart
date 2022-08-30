import 'package:bop/features/data/repository/document_section_repository.dart';
import 'package:bop/features/data/repository/service_list_details.dart';
import 'package:bop/features/model/document_section_model.dart';
import 'package:get/get.dart';

class ServiceListDetailController extends GetxController{
  final ServiceListDetailRepository serviceListDetailRepo;

  ServiceListDetailController({required this.serviceListDetailRepo});
  List<dynamic> _documentSectionList=[];
  List<dynamic> get sectionList=>_documentSectionList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;

  Future<void> getDocumentSectionList() async{
    Response response = await serviceListDetailRepo.getDocumentSectionList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _documentSectionList=[];
      _documentSectionList.addAll(DocumentSectionModel.fromJson(response.body).section);
      print(response.body);
      update();
      _isLoaded=true;
    }else{
    }
  }

  Future<void> getDocumentSectionListByID(int id) async{
    Response response = await serviceListDetailRepo.getDocumentSectionListByID(id);
    if(response.statusCode==200){
      //print("got Products====================================");
      _documentSectionList=[];
      _documentSectionList.addAll(DocumentSectionModel.fromJson(response.body).section);
      print(response.body);
      update();
      _isLoaded=true;
    }else{
    }
  }


}