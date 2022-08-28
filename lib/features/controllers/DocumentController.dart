import 'package:bop/features/data/repository/DocumentRepository.dart';
import 'package:bop/features/model/document_model.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController{
  final DocumentRepository documentRepo;

  DocumentController({required this.documentRepo});
  List<dynamic> _documentList=[];
  List<dynamic> get documentList=>_documentList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;


  Future<void> getPopularProductList() async{
    Response response = await documentRepo.getPopularProductList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _documentList=[];
      _documentList.addAll(DocumentModel.fromJson(response.body).document);
      //_documentList.addAll(BankServiceModel.fromJson(response.body).description);
      print(response.body);
      update();
      _isLoaded=true;
    }else{

    }


  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity++;
    }
    else{
      _quantity--;
    }

  }


}